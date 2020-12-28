package com.gotrip.repository;

import com.gotrip.entity.PlaceEntity;
import com.gotrip.entity.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlaceRepository extends JpaRepository<PlaceEntity, Long> {
    List<PlaceEntity> findOneByParentPlaceId(long id);
    List<PlaceEntity> findAllByName(String name);
    PlaceEntity findOneByName(String name);
    List<PlaceEntity> findAllByParentPlaceId(long id);
}
