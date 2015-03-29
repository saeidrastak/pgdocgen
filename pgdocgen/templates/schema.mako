<%inherit file="base.mako" />

            <h1 class="d-heading">
                ${title}
            </h1>
            
            <table cellpadding = '20px'>
            % for f in functions:
              <tr>
              <td>
                <h3>Function <span class="code">${f.schema_name}.${f.object_name}</span></h3>
                <p>${f.comment}</p>
                % if len(f.params) > 0:
                  <p><strong>Parameters:</strong>
                  <ul>
                    % for p in f.params:
                      <li>${p[1]}</li>
                    % endfor
                  </ul>
                  </p>
                % endif
                <p><strong>Returns:</strong> ${f.returns}</p>
              </td>
              </tr>
            % endfor
            % for f in tables:
              <tr>
              <td>
                <h3>Table <span class="code">${f.schema_name}.${f.object_name}</span></h3>
                <p>${f.comment}</p>
                % if len(f.params) > 0:
                  <p><strong>Columns:</strong></p>
                  <ul>
                    % for p in f.params:
                      <li>${p['name']} (${p['type']}) - ${p['comment']}</li>
                    % endfor
                  </ul>
                % endif
              </td>
              </tr>
            % endfor
            </table>

