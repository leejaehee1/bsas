package com.jsoftware.platform.controller;

import com.jsoftware.platform.model.Board;
import com.jsoftware.platform.service.BoardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.filechooser.FileSystemView;

@Controller
public class BoardController {

    private BoardService service;

    public BoardController(BoardService service) {
        this.service = service;
    }

    // ui 화면으로 출력해냄
    @GetMapping("/board")
    public String board() {
        System.out.printf("****** Board list");
        return "board";
    }

    // json 타입으로 출력해냄
    @GetMapping("/boardList")
    @ResponseBody
    public List<Board> getBoards(){
        System.out.printf("****** Board list");
        return service.getBoards();
    }

    // ui 화면 (html)
    @GetMapping("/write")
    public String write() {
        System.out.printf("****** Board write");
        return "write";
    }

    /*// writeAction
    @PostMapping("/writeAction")
    public String writeAction(Board board) {
        service.addBoard(board);
        System.out.printf("****** Board write");
        return "board";
    }*/

    @PostMapping("/writeAction")
    public String writeAction(
            HttpServletRequest req, @RequestParam("file") MultipartFile file,
            @RequestParam("title")String title,
            @RequestParam("contents")String contents) throws IllegalStateException, IOException {

        /*String PATH = req.getSession().getServletContext().getRealPath("/") + "resources/";

        if (!file.getOriginalFilename().isEmpty()) {
            file.transferTo(new File(PATH + file.getOriginalFilename()));
        }*/

        String rootPath = FileSystemView.getFileSystemView().getHomeDirectory().toString(); // 바탕화면 주소
//        String basePath = rootPath + "/" + "single"; // 바탕화면/single
        String basePath = rootPath + "/apps/bsas/engine/src/main/resources/static/" + "single"; // aws 서버 주소

        System.out.printf("****** file at Desktop");

        String filePath = basePath + "/" + file.getOriginalFilename(); // 바탕화면/single/파일이름
        System.out.printf("****** file at single");


        if (!file.getOriginalFilename().isEmpty()) {
            File dest = new File(filePath);
            file.transferTo(dest); // 파일 업로드 작업 수행
        }

        System.out.printf("****** file upload");

        service.addBoard(new Board(0, title, contents, file.getOriginalFilename()));

        System.out.printf("****** add board");

        return "redirect:/board";
    }

    @GetMapping("/view")
    public String view() {
        System.out.printf("****** Board detail");
        return "view";
    }

    @GetMapping("/boardView")
    @ResponseBody
    public Board boardList(@RequestParam("idx") int idx) {
        System.out.printf("****** Board detail");
        return service.getBoardOne(idx);
    }

    // http://localhost:18080/view?idx=4
    @PutMapping("/view")
    public String updateBoard(@RequestParam("idx") int idx,
                              @RequestBody Board board) {
        System.out.printf("****** Board update 1-3");
        service.getBoardOne(idx);
        System.out.printf("****** Board update 2-3");
        service.updateBoard(board);
        System.out.printf("****** Board update 3-3");
        return "board";
    }

    @DeleteMapping("/delete")
    public String deleteBoard(int idx) {
        System.out.println("delete Board" + idx);
        service.deleteBoard(idx);
        System.out.println(idx + "delete Board complete ****** ");
        return "delete Board idx" + idx;
    }

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