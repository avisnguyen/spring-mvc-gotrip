package com.gotrip.repository;

import com.gotrip.entity.PostEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<PostEntity, Long> {
    List<PostEntity> findAllByOrderByIdDesc();
    List<PostEntity> findAllByCategoryIdOrderByIdDesc(long CategoryId);
    List<PostEntity> findAllByCategoryCodeOrderByIdDesc(String code);
    PostEntity findOneByCategoryCode(String code);
}
