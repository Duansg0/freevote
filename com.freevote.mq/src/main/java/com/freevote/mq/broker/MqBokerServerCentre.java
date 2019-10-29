package com.freevote.mq.broker;

import com.freevote.mq.constant.MqAgreementConstant;
import com.freevote.mq.core.MqBrokerHandler;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
 * @dec 临时使用,细节待优化
 * @author Duansg
 */
@Service
public class MqBokerServerCentre  {

    private static MqBroker mqBroker = MqBrokerHandler.build(10);

    public static String execute(String message) {
        if (StringUtils.isBlank(message)){
            return "FAIL:";
        }
        if (message.startsWith("PRODUCER")){
            if (message.startsWith(MqAgreementConstant.PRODUCER_OFFER)){
                mqBroker.offer(message.replace(MqAgreementConstant.PRODUCER_OFFER,""));
            }else if(message.startsWith(MqAgreementConstant.PRODUCER_PUT)){
                mqBroker.put(message.replace(MqAgreementConstant.PRODUCER_PUT,""));
            }
            return "SUCCESS";
        }else if (message.startsWith("CONSUME")){
            String res = null;
            if (message.startsWith(MqAgreementConstant.CONSUME_TAKE)){
                res = mqBroker.take();
            }else if (message.startsWith(MqAgreementConstant.CONSUME_POLL)){
                res = mqBroker.poll();
            }
            return res;
        }else {
            return "FAIL:";
        }
    }

}
