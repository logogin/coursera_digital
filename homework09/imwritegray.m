function imwritegray(varargin)
    if exist('octave_config_info')
        data = varargin{1};
        data_d(:,:,1) = data(:,:);
        data_d(:,:,2) = data(:,:);
        data_d(:,:,3) = data(:,:);
        varargin{1} = data_d;
        imwrite(varargin{:});
    else
        imwrite(varargin{:});
    end
end
