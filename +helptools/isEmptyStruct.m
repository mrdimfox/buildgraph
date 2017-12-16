function [ isEmpty ] = isEmptyStruct( s )
%%  isEmptyStruct  return true if s == {}.
%
%   s              checking struct.

    isEmpty = isempty(fieldnames(s));
end

