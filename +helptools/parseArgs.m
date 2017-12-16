function args_parsed = parseArgs(args, addParamsFuncs)
%%  parseArgs  wrapper over the inputParser. 
%
%   It parses args using an inputParser and user funcs for a
%   preconfiguring params. Returns resut of parsing (Results struct only).
%
%   args             input arguments to parse. 
%                    Usually it has name like 'varargin' or 'argv'
%   addParamsFuncs   array of lambdas containing functions like
%                    addOptional, addParameter, addParamValue, addRequired.
%
%   EXAMPLE OF USE:
%   optionalArgsProc = {...
%       @(p)addParameter(p,   'isModelSimulationOn', true);
%       @(p)addParameter(p,   'isPrintingEnable',    false);
%       @(p)addParameter(p,   'plotSavePath',        './');
%       @(p)addParameter(p,   'prefix',              '', @(s)ischar(s));
%   };
%   args = parseArgs(varargin, optionalArgsProc);
%   if args.isPrintingEnable
%       disp(args.prefix)
%   end
%
%   See also inputParser, parse.

    p_ = inputParser;
    for i = 1:length(addParamsFuncs)
        addParamsFuncs{i}(p_);
    end
    parse(p_, args{:})
    args_parsed = p_.Results;
end