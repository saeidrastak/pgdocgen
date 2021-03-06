<%inherit file="base.mako" />

            <h1 class="d-heading">
                ${title}
            </h1>
            <div class="d-content">
                <h2 class="d-content__title">
                    List of schemas:
                </h2>
                <ul class="d-list">
                    % for schema in schemas:
                    <li class="d-list__item">
                        <a href="${schema.object_name}.html">
                            Schema ${schema.object_name}
                        </a>
                        % if schema.comment:
                        <p>${schema.comment}</p>
                        % endif
                    </li>
                    % endfor
                </ul>
            </div>
        </div>
