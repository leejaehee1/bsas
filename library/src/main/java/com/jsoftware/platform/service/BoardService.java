package com.jsoftware.platform.service;

import com.jsoftware.platform.model.Board;
import com.jsoftware.platform.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    BoardRepository repository;

    @Cacheable(key = "#size", value = "getBoards")
    public List<Board> getBoards(String size) {
        return repository.createBySize(size);
    }

    public static int getDbCount() {
        return BoardRepository.getDbCount();
    }
}
