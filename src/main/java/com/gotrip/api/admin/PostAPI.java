package com.gotrip.api.admin;

import com.gotrip.model.PostModel;
import com.gotrip.service.IPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "postAPIOfAdmin")
public class PostAPI {
    @Autowired
    private IPostService postService;

    @PostMapping("/api/post")
    public PostModel createPost(@RequestBody PostModel postModel) {
        return postService.save(postModel);
    }

    @PutMapping("/api/post")
    public PostModel updatePost(@RequestBody PostModel updatePost) {
        return postService.save(updatePost);
    }

    @DeleteMapping("/api/post")
    public void deletePost(@RequestBody long[] ids) {
        postService.delete(ids);
    }
}
