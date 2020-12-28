package com.gotrip.api.admin;

import com.gotrip.model.CategoryModel;
import com.gotrip.model.PostModel;
import com.gotrip.service.ICategoryService;
import com.gotrip.service.IPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class CategoryAPI {
    @Autowired
    private ICategoryService categoryService;

    @PostMapping("/api/category")
    public CategoryModel createCategory(@RequestBody CategoryModel categoryModel) {
        return categoryService.save(categoryModel);
    }

    @PutMapping("/api/category")
    public CategoryModel updateCategory(@RequestBody CategoryModel updateCategory) {
        return categoryService.save(updateCategory);
    }

    @DeleteMapping("/api/category")
    public void deleteNew(@RequestBody long[] ids) {
        categoryService.delete(ids);
    }
}
