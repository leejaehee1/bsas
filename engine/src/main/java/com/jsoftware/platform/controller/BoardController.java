package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.Board;
import com.jsoftware.platform.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BoardController {

    private BoardService service;

    public BoardController(BoardService service) {
        this.service = service;
    }

    @PostMapping("/api/boards")
    public Board addBoard(@RequestBody Board board) {
        System.out.println("Create Board");
        return service.addBoard(board);
    }

    @GetMapping("/api/boards")
    public List<Board> getBoards() {
        System.out.printf("Board list ------");
        return service.getBoards();
    }

    @GetMapping("/api/boards/{id}")
    public Board getBoardOne(@PathVariable("id") int id) {
        System.out.println("Board" + id);
        return service.getBoardOne(id);
    }

    @PutMapping("/api/boards/{id}")
    public Board updateBoard(@RequestBody Board board) {
        System.out.println("Modify Board");
        return service.updateBoard(board);
    }

    @DeleteMapping("/api/boards/{id}")
    public String deleteBoard(@PathVariable("id") int id) {
        System.out.println("delete Board" + id);
        service.deleteBoard(id);
        System.out.println(id + "delete Board complete");
        return "delete id" + id;
    }

    // ----------------------------------------------------------------

    /*// ui 화면으로 출력해냄
    @GetMapping("/board")
    public String board() {
        return "board";
    }

    // json 타입으로 출력해냄
    @GetMapping("/boardList")
    @ResponseBody
    public List<Board> getBoards(){
        return service.getBoards();
    }

    // ui 화면 (html)
    @GetMapping("/write")
    public String write() {
        return "write";
    }

    // get support가 없음
    @PostMapping("/writeAction")
    public String writeAction(@RequestBody Board board) {
        service.addBoard(board);
        return "board";
    }

    // id로 get하는 화면이 필요함
    @GetMapping("/boardView")
    public String view() {
        return "view";
    }


    @GetMapping("/boardView/{id}")
    public Board getBoardOne(@PathVariable int id) {
        return service.getBoardOne(id);
    }*/


    // ---------------------------------------------
    // 이하는 원래 있던 코드

//    @GetMapping("/contents")
//    public String getContents(Model model, String idx) {
//        // db select
////        List<Board> boardList = service.getBoards("11");
//        System.out.println("idx:" + idx);
//        if (idx != null) {
////            Board board = new Board(Long.valueOf(idx), idx + "번째 글", idx + "번째 내용");
//            Board board = service.getBoardById(Long.valueOf(idx));
//            model.addAttribute("board", board);
//        }
//
//        return "contents";
//    }
//
///*
//    @GetMapping("/board")
//    public String getBoard(Model model) {
//        System.out.println("GetMapping board");
//        // db select
////        List<Board> boardList = service.getBoards("11");
//        List<Board> boardList = service.getAllBoards();
//        model.addAttribute("boardList", boardList);
//        return "board";
//    }
//*/
//
//    @GetMapping("/board")
//    public String getBoardPaging(Model model, @RequestParam(value = "current", required = false, defaultValue = "1") int currentPage) {
//        System.out.println("GetMapping board paging");
//        // db select
////        List<Board> boardList = service.getBoards("11");
//
//        int pagingSize = 10;
//
//        List<Board> boardList = service.getAllBoards();
//
//        int totalSize = boardList.size();
//
//        int startItemNum = (currentPage - 1) * pagingSize;
//        int endItemNum = Math.min(startItemNum + totalSize - 1, totalSize);
//
//        int startPageNum = 1;
//        int endPageNum = (totalSize / pagingSize) + 2;
//
//        List<Integer> pagingList = new ArrayList<>();
//
//        for (int i = startPageNum; i < endPageNum; i++) {
//            pagingList.add(i);
//        }
//
//        model.addAttribute("boardList", boardList.subList(startItemNum, endItemNum));
//        model.addAttribute("pagingList", pagingList);
//        return "board";
//    }
//
//    // http://localhost:18080/contents?idx=1
//    @PostMapping("/board")
//    public String saveContent(@RequestBody Board board) {
//        // db select
//        System.out.println("PostMapping board");
//        System.out.println("PostMapping board==>" + board);
//        service.addBoard(board);
////        List<Board> boardList = service.getBoards("11");
////        Board board = new Board(Long.valueOf(idx), idx + "번째 글", idx + "번째 내용");
////        model.addAttribute("board", board);
//        return "board";
//    }
//
//    @PutMapping("/board/{idx}")
//    public String updateContent(@PathVariable("idx") Long idx, @RequestBody Board board) {
//        // db select
//        System.out.println("idx===>" + idx);
//        service.updateBoard(board);
////        List<Board> boardList = service.getBoards("11");
////        Board board = new Board(Long.valueOf(idx), idx + "번째 글", idx + "번째 내용");
////        model.addAttribute("board", board);
//        return "board";
//    }
//
//    @DeleteMapping("/board/{idx}")
//    public String deleteContent(@PathVariable("idx") Long idx) {
//        // db select
//        System.out.println("idx===>" + idx);
//        Board board = new Board();
//        board.setId(idx);
//        service.deleteBoard(board);
////        List<Board> boardList = service.getBoards("11");
////        Board board = new Board(Long.valueOf(idx), idx + "번째 글", idx + "번째 내용");
////        model.addAttribute("board", board);
//        return "board";
//    }
}