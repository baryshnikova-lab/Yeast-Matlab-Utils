function bool = is_genename(vector)

num = cellfun(@isnumeric, vector);

bool = zeros(size(vector));
bool(~num) = ~cellfun(@isempty, regexpi(vector(~num), '^[A-Z]{3,}[0-9]{1,4}([A-E])?$'));

bool(~cellfun(@isempty, regexpi(vector(~num), '^RP[LS]?[0-9]+[A-E]*'))) = 1;
bool(~cellfun(@isempty, regexpi(vector(~num), '^[A-Z]{3,}[0-9]{1,4}-[0-9]$'))) = 1;

% Exceptions to the rule
bool(strcmp('HO', vector)) = 1;
bool(strcmp('OM45', vector)) = 1;
bool(strcmp('YRF1-6', vector)) = 1;
bool(strcmp('ADE5,7', vector)) = 1;
bool(strcmp('ARG5,6', vector)) = 1;
bool(strcmp('MF(ALPHA)1', vector)) = 1;
bool(strcmp('MF(ALPHA)2', vector)) = 1;
bool(strcmp('DUR1,2', vector)) = 1;



