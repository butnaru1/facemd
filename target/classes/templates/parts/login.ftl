<#macro  login path isRegisterForm>

    <form method="post" action="${path}">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Username</label>
            <div class="col-sm-6">
                <input type="username" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       name="username" placeholder="Username" value="<#if user??>${user.username}</#if>">
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-6">
                <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       name="password" placeholder="Password">
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Password Confirmation</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control ${(password2Error??)?string('is-invalid', '')}"
                           name="passwordConfirm" placeholder="Password">
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-6">
                    <input type="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                           name="email" placeholder="name@mail.com" value="<#if user??>${user.email}</#if>">
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="g-recaptcha" data-sitekey="6LfDzsAUAAAAAM-6E_o5wQ2Okoyhu_bPqsE6NZhV"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>
        </#if>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="form-group row">
            <div class="col-sm-6">
                <button type="submit" class="btn btn-primary"><#if isRegisterForm>Create<#else>Sign in</#if></button>
            </div>
        </div>
        <div class="form-group row">
            <#if !isRegisterForm><a href="/registration">Add new user</a> </#if>
        </div>
    </form>
</#macro>

<#macro logout>
    <form method="post" action="/logout">
        <button type="submit" class="btn btn-primary">Logout</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
</#macro>