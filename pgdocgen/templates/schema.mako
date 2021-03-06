<%inherit file="base.mako" />

<div id="sidebar" class="d-function-list d-function-list_maximized_state">
                <div class="d-function-list__content">
                    <ul class="d-function-list__f-level">
                        <li class="d-function-list__item selected">
                            <span class="minus">
                            </span>
                            <a href="#">
                                Schema ${schema_name}
                            </a>
                            <ul class="d-function-list__s-level">
                            % for f in functions:
                                <li class="d-function-list__item">
                                    <a href="#${f.object_name}">
                                        <b>F</b>&nbsp;${f.schema_name}.${f.object_name}
                                    </a>
                                </li>
                            % endfor
                            </ul>
                            <ul class="d-function-list__s-level">
                            % for t in tables:
                                <li class="d-function-list__item">
                                    <a href="#${t.object_name}">
                                    <%
                                        if t.object_type == 'table':
                                          ttype = 'T'
                                        elif t.object_type == 'view':
                                          ttype = 'V'
                                        elif t.object_type == 'materialized view':
                                          ttype = 'MV'
                                        elif t.object_type == 'foreign table':
                                          ttype = 'FT'
                                        else:
                                          ttype = '?'
                                    %>
                                    <b>${ttype}</b>&nbsp;${t.schema_name}.${t.object_name}
                                    </a>
                                </li>
                            % endfor
                            </ul>
                        </li>
                        % for s in schemas:
                        % if schema_name != s.object_name:
                        <li class="d-function-list__item">
                            <a href="${s.object_name}.html">
                            <span class="plus">
                            </span>
                                Schema ${s.object_name}
                            </a>
                        </li>
                        % endif
                        % endfor
                    </ul>
                </div>
                <div id="btn" class="d-function-list__btn-cover" href="#">
                    <span></span>
                    <a href="#" onclick="toggle(event)">
                        Contents
                    </a>
                </div>
            </div>
            <a class="d-breadcrumbs" href="index.html">
                <span class="d-breadcrumbs__arrow"></span>
                Back to index
            </a>
            <h1 class="d-heading">
                ${title}
            </h1>

            <div class="d-content">
            % for f in functions:
                <section class="d-function">
                    <h1 class="d-function__title">
                        <a id="${f.object_name}">
                        Function
                            <span class="d-function__title_fname">
                                ${f.schema_name}.${f.object_name}
                            </span>
                        </a>
                    </h1>
                    <p class="d-function__description">
                        ${f.comment or ''}
                    </p>
                    % if len(f.params) > 0:
                    <div class="d-function__parameter">
                        <h2 class="d-function__parameter_title">
                            Parameters:
                        </h2>
                        % for p in f.params:
                        <p class="d-function__parameter_item">
                            <span>
                                ${p[1]}
                            </span>
                        </p>
                        % endfor
                    </div>
                    % endif
                    % if f.returns:
                    <p class="d-function__result">
                        Returns:
                        <span>
                            ${f.returns}
                        </span>
                    </p>
                    % endif
                </section>
            % endfor
            
            % for t in tables:
                <section class="d-function">
                    <h1 class="d-function__title">
                        <a id="${t.object_name}">
                            ${t.object_type.title()}
                            <span class="d-function__title_fname">
                                ${t.schema_name}.${t.object_name}
                            </span>
                        </a>
                    </h1>
                    <p class="d-function__description">
                        ${t.comment or ''}
                    </p>
                    % if len(t.params) > 0:
                    <div class="d-function__parameter">
                        <h2 class="d-function__parameter_title">
                            Fields:
                        </h2>
                        % for p in t.params:
                        <p class="d-function__parameter_item">
                            <span>
                                % if p['comment']:
                                  ${p['name']} (${p['type']}) - ${p['comment']}
                                % else:
                                  ${p['name']} (${p['type']})
                                % endif
                            </span>
                        </p>
                        % endfor
                    </div>
                    % endif
                </section>
            % endfor
            
            </div>
