package com.jsoftware.platform.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Chat {
    int type; // 0 : other or 1 : my
    String avatarUrl;
    String name;
    String text;
    String time;
}
