package com.lxzy.nomix.module.member.convert.auth;

import com.lxzy.nomix.module.member.controller.app.auth.vo.*;
import com.lxzy.nomix.module.member.controller.app.social.vo.AppSocialUserUnbindReqVO;
import com.lxzy.nomix.module.member.controller.app.user.vo.AppMemberUserResetPasswordReqVO;
import com.lxzy.nomix.framework.common.biz.system.oauth2.dto.OAuth2AccessTokenRespDTO;
import com.lxzy.nomix.module.system.api.sms.dto.code.SmsCodeSendReqDTO;
import com.lxzy.nomix.module.system.api.sms.dto.code.SmsCodeUseReqDTO;
import com.lxzy.nomix.module.system.api.sms.dto.code.SmsCodeValidateReqDTO;
import com.lxzy.nomix.module.system.api.social.dto.SocialUserBindReqDTO;
import com.lxzy.nomix.module.system.api.social.dto.SocialUserUnbindReqDTO;
import com.lxzy.nomix.module.system.api.social.dto.SocialWxJsapiSignatureRespDTO;
import com.lxzy.nomix.module.system.enums.sms.SmsSceneEnum;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface AuthConvert {

    AuthConvert INSTANCE = Mappers.getMapper(AuthConvert.class);

    SocialUserBindReqDTO convert(Long userId, Integer userType, AppAuthSocialLoginReqVO reqVO);
    SocialUserUnbindReqDTO convert(Long userId, Integer userType, AppSocialUserUnbindReqVO reqVO);

    SmsCodeSendReqDTO convert(AppAuthSmsSendReqVO reqVO);
    SmsCodeUseReqDTO convert(AppMemberUserResetPasswordReqVO reqVO, SmsSceneEnum scene, String usedIp);
    SmsCodeUseReqDTO convert(AppAuthSmsLoginReqVO reqVO, Integer scene, String usedIp);

    AppAuthLoginRespVO convert(OAuth2AccessTokenRespDTO bean, String openid);

    SmsCodeValidateReqDTO convert(AppAuthSmsValidateReqVO bean);

    SocialWxJsapiSignatureRespDTO convert(SocialWxJsapiSignatureRespDTO bean);

}
