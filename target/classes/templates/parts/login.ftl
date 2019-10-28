<#macro  login path isRegisterForm>

    <form method="post" action="${path}">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Username</label>
            <div class="col-sm-6">
                <input type="username" class="form-control" name="username" placeholder="Username">
            </div>
        </div>
     <div class="form-group row">
        <label  class="col-sm-2 col-form-label">Password</label>
        <div class="col-sm-6">
            <input type="password" class="form-control" name="password" placeholder="Password">
        </div>
    </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
   <div class="form-group row">
      <div class="col-sm-6">
         <button type="submit" class="btn btn-primary"><#if isRegisterForm>Create<#else>Sign in</#if></button>
      </div>
  </div>
  <div class="form-group row">
  <#if !isRegisterForm><a href="/registration">Add new user</a> </#if>
  </div>
</#macro>

<#macro logout>
    <form method="post" action="/logout">
        <button type="submit" class="btn btn-primary">Logout</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</#macro>