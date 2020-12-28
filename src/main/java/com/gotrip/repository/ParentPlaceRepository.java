package com.gotrip.repository;

import com.gotrip.entity.ParentPlaceEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ParentPlaceRepository extends JpaRepository<ParentPlaceEntity, Long> {
    ParentPlaceEntity findOneByCode(String code);
}
