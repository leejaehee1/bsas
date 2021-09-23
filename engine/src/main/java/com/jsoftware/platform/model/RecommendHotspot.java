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
@Table(name="recommend_hotspot")
public class RecommendHotspot {
    private String id;
    private String title;
    private String img_url;
    private String contents;
}
