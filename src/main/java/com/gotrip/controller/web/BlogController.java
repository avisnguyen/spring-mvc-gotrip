package com.gotrip.controller.web;

import com.gotrip.model.CategoryModel;
import com.gotrip.model.PostModel;
import com.gotrip.service.ICategoryService;
import com.gotrip.service.IPlaceService;
import com.gotrip.service.IPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BlogController {
    @Autowired
    private IPostService postService;

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private IPlaceService placeService;

    @RequestMapping(value = "/blog", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView blogPage( @RequestParam("page") int page,
                                  @RequestParam("limit") int limit) {
        ModelAndView mav = new ModelAndView("web/blog/blog");
        PostModel model = new PostModel();
        model.setPage(page);
        model.setLimit(limit);
        Pageable pageable = new PageRequest(page - 1, limit);
        model.setListResult(postService.findAll(pageable));
        model.setTotalItem(postService.getTotalItem());
        model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
        mav.addObject("model", model);
        mav.addObject("MB",placeService.findAllMB());
        mav.addObject("MT",placeService.findAllMT());
        mav.addObject("MN",placeService.findAllMN());
        return mav;
    }

    @RequestMapping(value = "/blog/{category}", method = RequestMethod.GET)
    public ModelAndView blogDetails(@RequestParam(value = "id", required = false) Long id){
        ModelAndView mav = new ModelAndView("web/blog/blog-detail");
        PostModel model = new PostModel();
        if (id != null) {
            model = postService.findById(id);
        }
        mav.addObject("categories", categoryService.findAll());
        mav.addObject("newPost", postService.findAllIdDesc());
        mav.addObject("postOfCate", postService.findAllByCategory(model));
        mav.addObject("model", model);
        mav.addObject("MB",placeService.findAllMB());
        mav.addObject("MT",placeService.findAllMT());
        mav.addObject("MN",placeService.findAllMN());
        return mav;
    }

    @RequestMapping(value = "/blog/cat/{categoryCode}", method = RequestMethod.GET)
    public ModelAndView catePage(@RequestParam(value = "cat", required = false) String code){
        ModelAndView mav = new ModelAndView("web/blog/blog-cate");
        PostModel model = new PostModel();
        CategoryModel categoryModel = categoryService.findByCode(code);
        model.setListResult(postService.findAllByCategoryCode(code));
        mav.addObject("model", model);
        mav.addObject("categoryModel", categoryModel);
        mav.addObject("MB",placeService.findAllMB());
        mav.addObject("MT",placeService.findAllMT());
        mav.addObject("MN",placeService.findAllMN());
        return mav;
    }
}
