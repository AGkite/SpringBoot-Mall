package com.newone.mall.common.domain.dos;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("users")
public class UserDO {
    @TableId(type = IdType.AUTO)
    private Long userId;
    private String username;
    private String password;
    private String phone;
    private String email;
    private String icon;
    private String address;
    private boolean isDeleted;
    private LocalDateTime createDate;
    private LocalDateTime modifyDate;
}
