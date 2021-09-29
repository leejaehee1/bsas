package com.jsoftware.platform.model;

import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="recommend_activity")
public class RecommendActivity {
    private int id;
    private String title;
    private String img_url;
    private String contents;

    @Override
    public String toString() {
        return String.format("recommend_activity[id='%d', title='%s', img_url='%s', contents='%s']", id, title, img_url, contents);
    }
}
