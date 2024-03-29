package com.icia.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;
@Getter
@Setter
@ToString
public class CommentDTO {
    private Long id;
    private String commentWriter;
    private String commentContents;
    private Timestamp commentCreatedDate;
    private Long memberId;
    private Long boardId;
}
