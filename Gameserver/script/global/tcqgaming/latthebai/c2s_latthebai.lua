--------------Lặt Thẻ Bài------------------
function c2s:Apply_ActiveGame_Latbai()
	LatTheBai:StartGame();
end
function c2s:Apply_Check_LatBai()
	LatTheBai:CheckBai();
end
function c2s:Apply_LoadCard()
	LatTheBai:LoadCard();
end
function c2s:Apply_ClickCard_Latbai(nPos,nId)
	if (type(nPos) ~= "number") then
		return 0;
	end
	LatTheBai:ClickCard(nPos,nId);
end