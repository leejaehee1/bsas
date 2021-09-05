package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.Chat;
import com.jsoftware.platform.model.ChatRoom;
import com.jsoftware.platform.vo.DataItem;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@RestController
public class HomeController {

    @Resource(name = "secondaryDataSource")
    private DataSource dataSource;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public class CustomRowMapper implements RowMapper<DataItem> {

        @Override
        public DataItem mapRow(ResultSet rs, int rowNum) throws SQLException {
            System.out.println(rs.toString());
            return null;
        }
    }

    @GetMapping("/home")
    public String findUid(HttpSession session) {
        return session.getId();
    }

    @CrossOrigin
    @GetMapping("/chatRooms")
    public List<ChatRoom> readChatRooms() {
        List<ChatRoom> chatRooms = new ArrayList<>();
        ChatRoom chatRoom = new ChatRoom();
        chatRoom.setContent("my content");
        chatRoom.setCount("10");
        chatRoom.setImageUrl("https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fmeeyn%2FbtqIZmZ8EYX%2FxQ2ttsrWljSoJFi30l5wZK%2Fimg.png");
        chatRoom.setTime("2021-09-03 18:00:00");
        chatRoom.setTitle("my title");
        chatRooms.add(chatRoom);
        System.out.println(chatRoom.toString());
        return chatRooms;
    }

    @CrossOrigin
    @GetMapping("/chats")
    public List<Chat> readChats() {
        List<Chat> chats = new ArrayList<>();
        Chat chat = new Chat();
        chat.setTime("2021-09-03 18:00:00");
        chat.setName("It's me.");
        chat.setText("hello how are you");
        chat.setType(0);
        chat.setAvatarUrl("https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fmeeyn%2FbtqIZmZ8EYX%2FxQ2ttsrWljSoJFi30l5wZK%2Fimg.png");
        chats.add(chat);

        chat = new Chat();
        chat.setTime("2021-09-03 18:01:00");
        chat.setName("John");
        chat.setText("I'm fine.");
        chat.setType(1);
        chat.setAvatarUrl("https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fmeeyn%2FbtqIZmZ8EYX%2FxQ2ttsrWljSoJFi30l5wZK%2Fimg.png");
        chats.add(chat);

        chat = new Chat();
        chat.setTime("2021-09-03 18:02:00");
        chat.setName("It's me.");
        chat.setText("good bye");
        chat.setType(0);
        chat.setAvatarUrl("https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fmeeyn%2FbtqIZmZ8EYX%2FxQ2ttsrWljSoJFi30l5wZK%2Fimg.png");
        chats.add(chat);
        return chats;
    }

    @GetMapping("/test/data")
    public String testDataSource(HttpSession session) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        String sql = "select * from table2 limit 10";
        for (DataItem dataItem : jdbcTemplate.query(sql, new CustomRowMapper())) {
            System.out.println(dataItem.toJson());
        }

        return "";
    }
}
