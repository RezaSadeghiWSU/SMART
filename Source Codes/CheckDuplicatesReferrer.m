%                             Copyright (C) <2017> 
%                        Mahdieh ZabihiMayvan, Reza Sadeghi   
%     Department of Computer Science and Engineering, Kno.e.sis Research Center, 
%                Wright State University, Dayton, OH, USA
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     any later version.
% 
%     This program is distributed under the License on an "AS IS" BASIS,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
%     Using this code or any associated file of this package in a publication, 
%     please CITE the related paper as below:
%
%     Zabihimayvan, Mahdieh, Reza Sadeghi, H. Nathan Rude, and Derek Doran. 
%     "A Soft Computing Approach for Benign and Malicious Web Robot Detection." 
%     Expert Systems with Applications 87 (2017) 129-140.

%     If you have any questions concerning the implementation of the code, 
%     please feel free to contact us via email addresses below:

%     Zabhimayvan.2@wright.edu, mahdieh@knoesis.org, sadeghi.2@wright.edu,
%     reza@knoesis.org.


function Duplicates=CheckDuplicatesReferrer(Similar,Referrer,DataVolume,IP,UserAgent,Duplicates)
    [FileNew,Order]=sort(Referrer(Similar));
    CheckF=1;
    while (CheckF<=numel(FileNew))
        SimilarF=Similar(Order(CheckF));
        for InerCheckF=CheckF+1:numel(FileNew)
            if(strcmp(FileNew(CheckF),FileNew(InerCheckF)))
                SimilarF=[SimilarF; Similar(Order(InerCheckF))];
                if(InerCheckF==numel(FileNew))
                    %Found more than two duplicates in ... and Referrer->go to next check
                    Duplicates=CheckDuplicatesDataVolume(SimilarF,DataVolume,IP,UserAgent,Duplicates);
                end
            elseif(numel(SimilarF)>1)
                %Found more than two duplicates in ... and Referrer->go to next check
                Duplicates=CheckDuplicatesDataVolume(SimilarF,DataVolume,IP,UserAgent,Duplicates);
                break;
            else
                break;
            end
        end
        CheckF=InerCheckF;
    end
end