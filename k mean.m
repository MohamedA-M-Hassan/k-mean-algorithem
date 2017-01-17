function centers = kMean(nCenters,nSample,data)
    % initialization
    rndIDX = randperm(nSample); 
    centers = data(rndIDX(1:nCenters), :); 
    centers=  centers(:,1:2);
          %kmeans
    assign=ones(nSample,1); %INITIALY = 1
    for iteration=1:5
        for i = 1:nSample
            %d(j,1)= sqrt(((data(i,1)-centers(j,1))^2)+((data()-centers)^2))); 
             %vectorization way
             wayToDistance=centers.-data(i,1:2);
             wayToDistance2=wayToDistance.^2;
             wayToDistance3=sum(wayToDistance2,2);
             % finally the distance ya kbeer
             dis=sqrt(wayToDistance3);
             [x,assign(i)]=min(dis);
        end
        % to get the mean
        count=zeros(nCenters,1);%INITIALY = 0
        summation = zeros (nCenters,2);
        for i= 1:nCenters
            for j=1:nSample
                if (assign(j)==i)
                    summation(i,:) =summation(i,:) + data(j,1:2);
                    count(i) =count(i) + 1;
                end   
                
            end     
        end
        centers =summation ./ count;
    end