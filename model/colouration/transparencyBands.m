function [transparency_dB, centerFrequencies] = transparencyBands(testIr, refIr, lsAziEle, fs)

%idxEar(lsAziEle(:, 1) <= 0) = 1;
%idxEar(lsAziEle(:, 1) > 0) = 2;

idxEar = 1;

octBank = octaveFilterBank('SampleRate',fs, 'OctaveRatioBase',2,'FilterOrder', 4);
centerFrequencies = getCenterFrequencies(octBank);

nfft = 4096;

XTest = abs(fft(testIr(:, :, idxEar), nfft));
XRef = abs(fft(refIr(:, :, idxEar), nfft));

octaveFilters = fft(octBank([1; zeros(nfft-1, 1)]));

for iBand = 1:length(centerFrequencies)

magnitudesOctRef(iBand) = sum(abs(XRef(1:nfft/2+1).* octaveFilters(1:nfft/2+1, iBand)));
magnitudesOctTest(iBand) = sum(abs(XTest(1:nfft/2+1).* octaveFilters(1:nfft/2+1, iBand)));

end

%testIrOctaveBand = octBank(squeeze(testIr));
%refIrOctaveBand = octBank(squeeze(refIr));



%magnitudesOctRef = squeeze(sqrt(sum(refIrOctaveBand(:, :, idxEar).^2, 1)));
%magnitudesOctTest = squeeze(sqrt(sum(testIrOctaveBand(:, :, idxEar).^2, 1)));

transparency_dB = 20*log10((magnitudesOctTest) ./ (magnitudesOctRef));

centerFrequencies = centerFrequencies(5:10);
transparency_dB = transparency_dB(5:10);

end