package com.newlearn.facemd.repository;

import com.newlearn.facemd.domain.Message;
import org.springframework.data.repository.CrudRepository;

public interface MessageRepository extends CrudRepository<Message, Long> {
    Iterable<Message> findAllByTag(String tag);
}
