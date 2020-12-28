package com.gotrip.repository;

import com.gotrip.entity.ContactInfoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContactInfoRepository extends JpaRepository<ContactInfoEntity, Long> {
}
