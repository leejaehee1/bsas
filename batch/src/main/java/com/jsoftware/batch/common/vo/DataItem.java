package com.jsoftware.batch.common.vo;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import com.google.gson.*;
import org.springframework.util.StringUtils;

import java.io.Serializable;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.util.*;

@Data
@ToString
@Setter
@Getter
public class DataItem extends LinkedHashMap<String, Object> implements Serializable {

    public DataItem() { super();}

    public DataItem(String key, Object value) {
        this.put(key, value);
    }

    public DataItem append(String key, Object value) {
        this.put(key, value);
        return this;
    }

    public void emptyToNull() {
        for (String key : this.keySet()) {
            if ("".equals((this.get(key) + "").trim())) {
                this.put(key, null);
            }
        }
    }

    public String toJson() {
        return toJson(false);
    }

    public String toJson(boolean prettyFlag) {
        if(prettyFlag) {
            GsonBuilder builder = new GsonBuilder().setPrettyPrinting();
            builder.registerTypeAdapter(DataItemSerializer.class, new DataItemSerializer());
            Gson gson = builder.disableHtmlEscaping().create();
            return gson.toJson(this);
        } else {
            GsonBuilder builder = new GsonBuilder();
            builder.registerTypeAdapter(DataItemSerializer.class, new DataItemSerializer());
            Gson gson = builder.disableHtmlEscaping().create();
            return gson.toJson(this);
        }
    }

    public static DataItem parse(String content) {
        GsonBuilder builder = new GsonBuilder();
        builder.registerTypeAdapter(DataItem.class, new DataItemSerializer());
        Gson gson = builder.create();
        return gson.fromJson(content, DataItem.class);
    }

    public List<DataItem> getList(String key) {
        return (List<DataItem>) this.get(key);
    }

    public DataItem getDataItem(String key) {
        return (DataItem) this.get(key);
    }

    public String getString(String key) {
        if(get(key) == null) {
            return null;
        } else {
            return get(key) + "";
        }
    }

    public int getInt(String key) {
        int value = 0;
        try {
            value = Integer.parseInt(get(key) + "");
        } catch (NumberFormatException e) {

        }

        return value;
    }

    public long getLong(String key) {
        long value = 0L;
        try {
            value = Long.parseLong(get(key) + "");
        } catch (NumberFormatException e) {

        }

        return value;
    }

    public float getFloat(String key) {
        float value = 0L;
        try {
            value = Float.parseFloat(get(key) + "");
        } catch (NumberFormatException e) {

        }

        return value;
    }

    public double getDouble(String key) {
        double value = 0D;
        try {
            value = Double.parseDouble(get(key) + "");
        } catch (NumberFormatException e) {

        }

        return value;
    }

    public boolean getBoolean(String key) {
        boolean value = false;
        try {
            value = Boolean.parseBoolean((get(key) + "").toLowerCase());
        } catch (NumberFormatException e) {

        }

        return value;
    }

    public boolean isNull(String key) {
        if(get(key) == null || "".equals(get(key) + "") || "null".equals(get(key) + "")){
            return true;
        } else {
            return false;
        }
    }

    private static class DataItemSerializer implements JsonDeserializer<DataItem> {
        public DataItem deserialize(JsonElement json, Type type, JsonDeserializationContext context) throws JsonParseException {
            return convert(json, type, context);
        }

        private DataItem convert(JsonElement json, Type type, JsonDeserializationContext context) {
            DataItem item = new DataItem();

            JsonObject jsonObject = json.getAsJsonObject();
            Iterator<Map.Entry<String, JsonElement>> entries = jsonObject.entrySet().iterator();
            while(entries.hasNext()) {
                Map.Entry<String, JsonElement> entry = entries.next();
                String key = entry.getKey();
                JsonElement value = entry.getValue();

                if(value.isJsonNull()) {
                    item.put(key, "");
                } else if (value.isJsonPrimitive()) {
                    JsonPrimitive primitive = (JsonPrimitive) value;
                    if(primitive.isNumber()) {
                        BigDecimal valDecimal = new BigDecimal(primitive.getAsString());
                        if(valDecimal.scale() < 1) {
                            item.put(key, primitive.getAsInt());
                        } else {
                            BigDecimal scale = valDecimal.subtract(new BigDecimal(valDecimal.intValue()));
                            if(scale.doubleValue() == 0d) {
                                item.put(key, primitive.getAsInt());
                            } else {
                                item.put(key, primitive.getAsDouble());
                            }
                        }
                    } else if(primitive.isBoolean()) {
                        item.put(key, primitive.getAsBoolean());
                    } else {
                        item.put(key, primitive.getAsString());
                    }
                } else if(value.isJsonArray()) {
                    JsonArray arr = (JsonArray) value;
                    List<DataItem> list = new ArrayList<>();
                    for (int inx = 0; inx < arr.size(); inx++) {
                        list.add(convert(arr.get(inx),type, context));
                    }
                    item.put(key,list);
                }else if(value.isJsonObject()) {
                    item.put(key,convert(value, type, context));
                }else {
                    item.put(key, value);
                }

            }

            return item;
        }
    }

    public DataItem toCamelCase() {
        String[] keys = new String[this.size()];
        this.keySet().toArray(keys);
        String newKey = null;

        for(String key : keys) {
            if(key.contains("_")) {
                newKey = camelize(key, true);
            } else {
                newKey = key.toLowerCase();
            }
            if(!key.equals(newKey)) {
                this.put(camelize(key, true), this.get(key));
                this.remove(key);
            }
        }

        return this;
    }

    private String camelize(String value, boolean startWithLoweCase) {
        String[] strings = StringUtils.split(value.toLowerCase(), "_");
        for (int i = startWithLoweCase?1:0; i < strings.length; i++) {
            strings[i] = StringUtils.capitalize(strings[i]);
        }

        return StringUtils.arrayToDelimitedString(strings, "");
    }
}