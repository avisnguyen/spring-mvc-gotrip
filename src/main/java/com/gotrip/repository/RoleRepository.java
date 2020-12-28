package com.gotrip.repository;

import com.gotrip.entity.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleRepository extends JpaRepository<RoleEntity, Long> {
    RoleEntity findOneByCode(String code);
    List<RoleEntity> findAllByCode(String code);
}
