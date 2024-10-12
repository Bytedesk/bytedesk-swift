<!--
 * @Author: jackning 270580156@qq.com
 * @Date: 2022-03-25 19:15:28
 * @LastEditors: jackning 270580156@qq.com
 * @LastEditTime: 2024-10-08 15:54:39
 * @Description: bytedesk.com https://github.com/Bytedesk/bytedesk
 *   Please be aware of the BSL license restrictions before installing Bytedesk IM – 
 *  selling, reselling, or hosting Bytedesk IM as a service is a breach of the terms and automatically terminates your rights under the license. 
 *  仅支持企业内部员工自用，严禁私自用于销售、二次销售或者部署SaaS方式销售 
 *  Business Source License 1.1: https://github.com/Bytedesk/bytedesk/blob/main/LICENSE 
 *  contact: 270580156@qq.com 
 *  联系：270580156@qq.com
 * Copyright (c) 2024 by bytedesk.com, All Rights Reserved. 
-->
# 步骤

- 替换更新文件
- 提交GitHub
- 打标签，并提交
- arch -x86_64 pod spec lint bytedesk-swift.podspec --verbose
- arch -x86_64 pod trunk push bytedesk-swift.podspec --verbose

- 其他
- arch -x86_64 pod repo update
- arch -x86_64 pod install --repo-update
- arch -x86_64 pod search bytedesk-core
