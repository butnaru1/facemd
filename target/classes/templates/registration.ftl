<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    <div>
        <div>Add user:</div>
       <#if message??>${message}</#if>
    </div>
    <@l.login "/registration" true></@l.login>
</@c.page>

