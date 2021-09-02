package com.jsoftware.batch.biz.S005;

import com.google.common.collect.Maps;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.item.xml.StaxEventItemReader;
import org.springframework.batch.item.xml.builder.StaxEventItemReaderBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.oxm.xstream.XStreamMarshaller;

import java.util.Map;

@Slf4j
@Configuration
@AllArgsConstructor
public class XmlFileItemReaderJobConfig {

    @Data
    public static class XmlItemVo {
        int number;
        String data;
    }

    private final JobBuilderFactory jobBuilderFactory;
    private final StepBuilderFactory stepBuilderFactory;
    private static final int chunkSize = 2;

    @Bean
    public Job xmlFileItemReaderJob() {
        return jobBuilderFactory.get("xmlFileItemReaderJob")
                .start(xmlFileItemReaderStep())
                .build();
    }

    @Bean
    public Step xmlFileItemReaderStep() {
        return stepBuilderFactory.get("xmlFileItemReaderStep")
                .<XmlItemVo, XmlItemVo>chunk(chunkSize)
                .reader(xmlFileItemReader())
                .writer(xmlItemVos -> xmlItemVos
                        .stream()
                        .map(XmlItemVo::toString)
                        .forEach(log::info))
                .build();
    }

    @Bean
    public StaxEventItemReader<XmlItemVo> xmlFileItemReader() {
        return new StaxEventItemReaderBuilder<XmlItemVo>()
                .name("xmlFileItemReader")
                .resource(new ClassPathResource("/read_sample/sample_xml_data.xml"))
                .addFragmentRootElements("item")
                .unmarshaller(itemMarshaller())
                .build();
    }

    @Bean
    public XStreamMarshaller itemMarshaller() {
        Map<String, Class<?>> aliases = Maps.newHashMap();
        aliases.put("item", XmlItemVo.class);
        aliases.put("number", Integer.class);
        aliases.put("data", String.class);
        XStreamMarshaller xStreamMarshaller = new XStreamMarshaller();
        xStreamMarshaller.setAliases(aliases);
        return xStreamMarshaller;
    }


}
