package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Hotspot;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HotspotRepository {
    List<Hotspot> readHotspots();

    Hotspot readHotspot(int id);

    void createHotspot(Hotspot hotspot);

    void updateHotspot(Hotspot hotspot);

    String deleteHotspot(int id);
}