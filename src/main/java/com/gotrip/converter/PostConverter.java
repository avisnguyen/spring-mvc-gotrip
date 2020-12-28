package com.gotrip.converter;

import com.gotrip.entity.PostEntity;
import com.gotrip.model.PostModel;
import org.springframework.stereotype.Component;

@Component
public class PostConverter {
    public PostEntity toEntity(PostEntity result, PostModel model){
        result.setTitle(model.getTitle());
        result.setShortDescription(model.getShortDescription());
        result.setContent(model.getContent());
        result.setThumbnail(model.getThumbnail());
        return result;
    }
    public PostEntity toEntity(PostModel model){
        PostEntity result = new PostEntity();
        result.setTitle(model.getTitle());
        result.setShortDescription(model.getShortDescription());
        result.setContent(model.getContent());
        result.setThumbnail(model.getThumbnail());
        return result;
    }
}
