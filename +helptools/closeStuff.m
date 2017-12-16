function closeStuff(varargin)
%%  closeStuff  close all open figures and simulink models.
%
%   closeFigs              if you want to close figures.
%   closeModels            if you want to close simulink models.
%
    optionalArgsProc = {...
        @(p)addOptional(p,    'closeFigs',   true);
        @(p)addOptional(p,    'closeModels', false);
    };
    
    args = helptools.parseArgs(varargin, optionalArgsProc);

    if args.closeFigs
        delete(findall(0,'Type','figure'))
    end
    
    if args.closeModels
        bdclose('all')
    end
end


