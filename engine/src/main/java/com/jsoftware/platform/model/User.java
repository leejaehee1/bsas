package com.jsoftware.platform.model;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@RequiredArgsConstructor
public class User {
    @NonNull
    private String userId;
    @NonNull
    private String userPwd;
    @NonNull
    private String name;
    private String authType;
}
