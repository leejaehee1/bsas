package com.jsoftware.platform.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoom {
    String imageUrl;
    String title;
    String content;
    String time;
    String count;
}
