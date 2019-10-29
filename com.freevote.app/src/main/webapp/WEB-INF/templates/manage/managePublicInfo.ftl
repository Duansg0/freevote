<div class="sidebar">
    <nav class="sidebar-nav">
        <ul class="nav">
            <li class="nav-title">Navigation</li>
        <#-- 仪表盘 -->
            <li class="nav-item">
                <a href="${basePath}/manage/index.htm" class="nav-link active">
                    <i class="icon icon-speedometer"></i> 总览
                </a>
            </li>
        <#-- 活动设置 -->
            <li class="nav-item nav-dropdown">
                <a href="${basePath}/manage/setting/index.htm" class="nav-link nav-dropdown-toggle">
                    <i class="icon icon-target"></i> 设置 <i class="fa fa-caret-left"></i>
                </a>

                <ul class="nav-dropdown-items">
                    <li class="nav-item">
                        <a href="${basePath}/manage/setting/index.htm" class="nav-link">
                            <i class="icon icon-target"></i> 活动设置
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${basePath}/manage/setting/addVote.htm" class="nav-link">
                            <i class="icon icon-target"></i> 活动新增
                        </a>
                    </li>
                </ul>
                <a href="${basePath}/manage/setting/getPayinfo.htm" class="nav-link">
                    <i class="icon icon-target"></i> 交易记录
                </a>

                <a href="${basePath}/manage/setting/addImgs.htm" class="nav-link">
                    <i class="icon icon-target"></i> 批量添加用户
                </a>
                <a href="${basePath}/manage/quick/modify.htm" class="nav-link">
                    <i class="icon icon-target"></i> 快捷修改
                </a>
                <a href="${basePath}/manage/setting/complaint.htm" class="nav-link">
                    <i class="icon icon-target"></i> 投诉列表
                </a>
            </li>
        </ul>
    </nav>
</div>