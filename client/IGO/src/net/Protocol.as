package net
{
    import com.yile.framework.net.IProtocol;
    import com.yile.framework.net.IResponse;
	import com.yile.games.doll.net.response.system.LoginResponse;
	import com.yile.games.doll.net.response.system.LoginGateResponse;
	import com.yile.games.doll.net.response.system.VisitorLoginResponse;
	import com.yile.games.doll.net.response.system.ReloginResponse;
	import com.yile.games.doll.net.response.system.ReloadConfigResponse;
	import com.yile.games.doll.net.response.system.KickUserOutNotifyResponse;
	import com.yile.games.doll.net.response.user.UserRoleListResponse;
	import com.yile.games.doll.net.response.user.CreateRoleResponse;
	import com.yile.games.doll.net.response.user.LoginRoleResponse;
	import com.yile.games.doll.net.response.user.RemoveRoleResponse;
	import com.yile.games.doll.net.response.user.ReqUserInfoResponse;
	import com.yile.games.doll.net.response.user.UserSkillListResponse;
	import com.yile.games.doll.net.response.user.AddUserSkillResponse;
	import com.yile.games.doll.net.response.user.ConfigUserSkillResponse;
	import com.yile.games.doll.net.response.user.UpgradeUserSkillResponse;
	import com.yile.games.doll.net.response.user.OfflineMsgResponse;
	import com.yile.games.doll.net.response.user.UpdateMoneyNotifyResponse;
	import com.yile.games.doll.net.response.user.EnableInstanceMapResponse;
	import com.yile.games.doll.net.response.user.UserObtainExpResponse;
	import com.yile.games.doll.net.response.user.ObtainPetInfoParaResponse;
	import com.yile.games.doll.net.response.user.ReqOtherUserInfoResponse;
	import com.yile.games.doll.net.response.user.InviteGameResultResponse;
	import com.yile.games.doll.net.response.user.DailyTaskListResponse;
	import com.yile.games.doll.net.response.user.UpdateDailyTaskResponse;
	import com.yile.games.doll.net.response.user.DailyTaskRewardListResponse;
	import com.yile.games.doll.net.response.user.ReqDailyTaskRewardResponse;
	import com.yile.games.doll.net.response.user.UpgradeObtainPetResponse;
	import com.yile.games.doll.net.response.user.ReqForbidInstanceTimeResponse;
	import com.yile.games.doll.net.response.user.GodmodePlayListResponse;
	import com.yile.games.doll.net.response.user.RefreshGodmodeResponse;
	import com.yile.games.doll.net.response.user.RecharegeMoneyParaResponse;
	import com.yile.games.doll.net.response.user.UserVipInfoResponse;
	import com.yile.games.doll.net.response.user.NewGuideNotifyResponse;
	import com.yile.games.doll.net.response.user.NewGuideDoneResponse;
	import com.yile.games.doll.net.response.user.SaveCustomDataResponse;
	import com.yile.games.doll.net.response.user.ReqCustomDataResponse;
	import com.yile.games.doll.net.response.user.ReqSystemSettingsResponse;
	import com.yile.games.doll.net.response.user.SetSystemSettingsResponse;
	import com.yile.games.doll.net.response.user.UserCollectRewardResponse;
	import com.yile.games.doll.net.response.user.KeepGameRewardResponse;
	import com.yile.games.doll.net.response.user.GodSealInfoResponse;
	import com.yile.games.doll.net.response.user.ReleaseGodSealResponse;
	import com.yile.games.doll.net.response.user.GodCtrlInfoResponse;
	import com.yile.games.doll.net.response.user.RaiseGodCtrlInfoResponse;
	import com.yile.games.doll.net.response.user.ResetGodCtrlInfoResponse;
	import com.yile.games.doll.net.response.user.UserCollectRewardInfoResponse;
	import com.yile.games.doll.net.response.user.DeployFightObjectResponse;
	import com.yile.games.doll.net.response.user.ReqRewardInstanceListResponse;
	import com.yile.games.doll.net.response.user.RefreshRewardInstanceResponse;
	import com.yile.games.doll.net.response.user.FightObjectInfoResponse;
	import com.yile.games.doll.net.response.user.DramaListResponse;
	import com.yile.games.doll.net.response.user.AddDramaResponse;
	import com.yile.games.doll.net.response.user.SaveUiOpenResponse;
	import com.yile.games.doll.net.response.user.UiOpenListResponse;
	import com.yile.games.doll.net.response.user.MyMopUpInfoResponse;
	import com.yile.games.doll.net.response.user.StartMopUpResponse;
	import com.yile.games.doll.net.response.user.MopUpResultResponse;
	import com.yile.games.doll.net.response.user.GetVipGiftpackResponse;
	import com.yile.games.doll.net.response.user.CancelAddictResponse;
	import com.yile.games.doll.net.response.user.ActivityRankRewardResponse;
	import com.yile.games.doll.net.response.user.UserFightbossInfoResponse;
	import com.yile.games.doll.net.response.user.UserFightbossRewardResponse;
	import com.yile.games.doll.net.response.user.ReqEventInstanceListResponse;
	import com.yile.games.doll.net.response.user.ReqCapitalActiveStateResponse;
	import com.yile.games.doll.net.response.user.RechargeFeedbackStateResponse;
	import com.yile.games.doll.net.response.user.ReqFeedbackGiftpackInfoResponse;
	import com.yile.games.doll.net.response.user.FirstRechargeStateInfoResponse;
	import com.yile.games.doll.net.response.user.FirstRechargeRewardInfoResponse;
	import com.yile.games.doll.net.response.user.UserConsumeInfoResponse;
	import com.yile.games.doll.net.response.user.ConsumeLotteryInfoResponse;
	import com.yile.games.doll.net.response.user.ActiveLoginInfoResponse;
	import com.yile.games.doll.net.response.user.GiftPackRewardListResponse;
	import com.yile.games.doll.net.response.user.GetGiftPackRewardResponse;
	import com.yile.games.doll.net.response.user.HoldOnlineResponse;
	import com.yile.games.doll.net.response.user.HoldOnlineTimerResponse;
	import com.yile.games.doll.net.response.user.CancelHoldOnlineResponse;
	import com.yile.games.doll.net.response.user.MyNpcRaceInfoResponse;
	import com.yile.games.doll.net.response.user.NpcRaceListResponse;
	import com.yile.games.doll.net.response.user.NpcRaceBetResponse;
	import com.yile.games.doll.net.response.user.NpcRaceStateResponse;
	import com.yile.games.doll.net.response.time.TimeResponse;
	import com.yile.games.doll.net.response.time.ReqClientTimeResponse;
	import com.yile.games.doll.net.response.hall.CreateRoomResponse;
	import com.yile.games.doll.net.response.hall.HallroomListResponse;
	import com.yile.games.doll.net.response.hall.RoomInfoResponse;
	import com.yile.games.doll.net.response.hall.EnterRoomResponse;
	import com.yile.games.doll.net.response.hall.LeaveRoomResponse;
	import com.yile.games.doll.net.response.hall.KickUserOutroomResponse;
	import com.yile.games.doll.net.response.hall.UpdateRoleResponse;
	import com.yile.games.doll.net.response.hall.HallUserStateResponse;
	import com.yile.games.doll.net.response.hall.ChangeGameInstanceResponse;
	import com.yile.games.doll.net.response.hall.InviteRelationIntoGameResponse;
	import com.yile.games.doll.net.response.hall.InviteIntoGameInfoNotifyResponse;
	import com.yile.games.doll.net.response.hall.StartGameResponse;
	import com.yile.games.doll.net.response.hall.QuickJoinGameResponse;
	import com.yile.games.doll.net.response.hall.UserLevelRankingResponse;
	import com.yile.games.doll.net.response.hall.UserWealthRankingResponse;
	import com.yile.games.doll.net.response.hall.UserCombatRankingResponse;
	import com.yile.games.doll.net.response.hall.UnionLevelRankingResponse;
	import com.yile.games.doll.net.response.hall.AutoEnterGameResponse;
	import com.yile.games.doll.net.response.hall.ReqMyRankingResponse;
	import com.yile.games.doll.net.response.hall.SetRoomStateResponse;
	import com.yile.games.doll.net.response.hall.UpdateRoomStateResponse;
	import com.yile.games.doll.net.response.hall.MatchGameResponse;
	import com.yile.games.doll.net.response.hall.CreateTeamInfoResponse;
	import com.yile.games.doll.net.response.hall.TeamDetailInfoResponse;
	import com.yile.games.doll.net.response.hall.TeamListInfoResponse;
	import com.yile.games.doll.net.response.hall.KickTeamUserInfoResponse;
	import com.yile.games.doll.net.response.hall.EnterTeamResponse;
	import com.yile.games.doll.net.response.hall.LeaveTeamResponse;
	import com.yile.games.doll.net.response.hall.TeamReadyGameResponse;
	import com.yile.games.doll.net.response.scene.EnterCopyMapResponse;
	import com.yile.games.doll.net.response.scene.EnterStationMapResponse;
	import com.yile.games.doll.net.response.scene.LeaveMapResponse;
	import com.yile.games.doll.net.response.scene.BatchAddUserResponse;
	import com.yile.games.doll.net.response.scene.MoveResponse;
	import com.yile.games.doll.net.response.scene.DeleteMapDataResponse;
	import com.yile.games.doll.net.response.scene.AddUserResponse;
	import com.yile.games.doll.net.response.scene.BatchRemoveMapDataResponse;
	import com.yile.games.doll.net.response.scene.ChangeMapResponse;
	import com.yile.games.doll.net.response.scene.UserObjectInfoResponse;
	import com.yile.games.doll.net.response.scene.PetInfoResponse;
	import com.yile.games.doll.net.response.scene.ScenePetInfoResponse;
	import com.yile.games.doll.net.response.scene.SceneUserInfoResponse;
	import com.yile.games.doll.net.response.scene.GoldMineResponse;
	import com.yile.games.doll.net.response.scene.DoorStateResponse;
	import com.yile.games.doll.net.response.scene.EndofInitResponse;
	import com.yile.games.doll.net.response.scene.SelectAttackNpcResponse;
	import com.yile.games.doll.net.response.scene.UpgradeNpcResponse;
	import com.yile.games.doll.net.response.scene.AttackStartResponse;
	import com.yile.games.doll.net.response.scene.MagicSwitchResponse;
	import com.yile.games.doll.net.response.scene.MagicAttackStartResultResponse;
	import com.yile.games.doll.net.response.scene.MagicAttackResponse;
	import com.yile.games.doll.net.response.scene.MagicAttackResultResponse;
	import com.yile.games.doll.net.response.scene.SetStateResponse;
	import com.yile.games.doll.net.response.scene.ClearStateResponse;
	import com.yile.games.doll.net.response.scene.SetHpResponse;
	import com.yile.games.doll.net.response.scene.DeathNotifyResponse;
	import com.yile.games.doll.net.response.scene.ReliveMapDataResponse;
	import com.yile.games.doll.net.response.scene.NpcLeaveNotifyResponse;
	import com.yile.games.doll.net.response.scene.GameResultNotifyResponse;
	import com.yile.games.doll.net.response.scene.ResourcePetInfoResponse;
	import com.yile.games.doll.net.response.scene.ResourcePetProductResponse;
	import com.yile.games.doll.net.response.scene.GetPetResourceResponse;
	import com.yile.games.doll.net.response.scene.BackOffStateResponse;
	import com.yile.games.doll.net.response.scene.SetSceneEffectResponse;
	import com.yile.games.doll.net.response.scene.SetTargetPetResponse;
	import com.yile.games.doll.net.response.scene.ChangeDoorStateResponse;
	import com.yile.games.doll.net.response.scene.ToggleDoorResponse;
	import com.yile.games.doll.net.response.scene.ToggleDoorNotifyOtherResponse;
	import com.yile.games.doll.net.response.scene.AddMapItemResponse;
	import com.yile.games.doll.net.response.scene.PickUpItemResponse;
	import com.yile.games.doll.net.response.scene.RightNowGameOverResponse;
	import com.yile.games.doll.net.response.scene.GotoResponse;
	import com.yile.games.doll.net.response.scene.SceneDpsListResponse;
	import com.yile.games.doll.net.response.scene.PlayBackgroundMusicResponse;
	import com.yile.games.doll.net.response.scene.LoadingProgressNotifyResponse;
	import com.yile.games.doll.net.response.chat.ChannelChatResponse;
	import com.yile.games.doll.net.response.chat.SysNotifyResponse;
	import com.yile.games.doll.net.response.union.UnionListInfoResponse;
	import com.yile.games.doll.net.response.union.UnionDetailInfoResponse;
	import com.yile.games.doll.net.response.union.UnionMemberInfoResponse;
	import com.yile.games.doll.net.response.union.ApplyInfoResponse;
	import com.yile.games.doll.net.response.union.CreateUnionResponse;
	import com.yile.games.doll.net.response.union.ApplyJoinResponse;
	import com.yile.games.doll.net.response.union.ApplyQuitResponse;
	import com.yile.games.doll.net.response.union.ApplyListResponse;
	import com.yile.games.doll.net.response.union.AllowApplyResponse;
	import com.yile.games.doll.net.response.union.ChangePowerResponse;
	import com.yile.games.doll.net.response.union.ChangeNoticeResponse;
	import com.yile.games.doll.net.response.union.ChangeLeaderResponse;
	import com.yile.games.doll.net.response.union.RemoveMemberResponse;
	import com.yile.games.doll.net.response.union.BroadcastMemberInfoResponse;
	import com.yile.games.doll.net.response.union.ChangeUnionStateResponse;
	import com.yile.games.doll.net.response.union.DissolveUnionResponse;
	import com.yile.games.doll.net.response.union.BroadcastUnionInfoResponse;
	import com.yile.games.doll.net.response.union.DonateUnionParaResponse;
	import com.yile.games.doll.net.response.union.UpgradeBaseInfoResponse;
	import com.yile.games.doll.net.response.union.UnionLotteryContentResponse;
	import com.yile.games.doll.net.response.union.UnionLotteryResponse;
	import com.yile.games.doll.net.response.union.UnionBuyObjectResponse;
	import com.yile.games.doll.net.response.union.UnionBaseBuildInfoResponse;
	import com.yile.games.doll.net.response.union.UnionAdvInfoResponse;
	import com.yile.games.doll.net.response.union.UnionMemberDpsRankInfoResponse;
	import com.yile.games.doll.net.response.union.UnionLotteryStopResponse;
	import com.yile.games.doll.net.response.union.UnionScoreRankResponse;
	import com.yile.games.doll.net.response.union.MemberScoreInfoResponse;
	import com.yile.games.doll.net.response.union.ReqUserJionUnionResponse;
	import com.yile.games.doll.net.response.union.UnionRequestNotifyResponse;
	import com.yile.games.doll.net.response.union.InviteUnionAnswerResponse;
	import com.yile.games.doll.net.response.union.UnionRequestResultResponse;
	import com.yile.games.doll.net.response.state.AddStateResponse;
	import com.yile.games.doll.net.response.state.GetUserStatesResponse;
	import com.yile.games.doll.net.response.state.RemoveStateResponse;
	import com.yile.games.doll.net.response.state.UpdateStateResponse;
	import com.yile.games.doll.net.response.general.ToOtherUserResponse;
	import com.yile.games.doll.net.response.relation.SendRelationListResponse;
	import com.yile.games.doll.net.response.relation.UpdateRelationStateResponse;
	import com.yile.games.doll.net.response.relation.RelationInteractionResponse;
	import com.yile.games.doll.net.response.relation.AddBadRelationResponse;
	import com.yile.games.doll.net.response.relation.RemoveRelationResponse;
	import com.yile.games.doll.net.response.item.AddItemListResponse;
	import com.yile.games.doll.net.response.item.UpdateItemResponse;
	import com.yile.games.doll.net.response.item.RemoveItemResponse;
	import com.yile.games.doll.net.response.item.SwapMoveItemResponse;
	import com.yile.games.doll.net.response.item.SplitItemResponse;
	import com.yile.games.doll.net.response.item.RefCountItemResponse;
	import com.yile.games.doll.net.response.item.UseItemResponse;
	import com.yile.games.doll.net.response.item.PackupItemResponse;
	import com.yile.games.doll.net.response.item.ChangeItemResponse;
	import com.yile.games.doll.net.response.item.SaveEnchancePropertyResponse;
	import com.yile.games.doll.net.response.item.EquipGridInfoResponse;
	import com.yile.games.doll.net.response.item.EquipGridUpgradeResponse;
	import com.yile.games.doll.net.response.item.HeroDetailInfoResponse;
	import com.yile.games.doll.net.response.item.EnableRebuildSkillsResponse;
	import com.yile.games.doll.net.response.item.RebuildHeroResponse;
	import com.yile.games.doll.net.response.item.UpgradeHeroQualityResponse;
	import com.yile.games.doll.net.response.item.UpgradeHeroSpeedResponse;
	import com.yile.games.doll.net.response.item.UpgradeHeroResponse;
	import com.yile.games.doll.net.response.item.BuyItemResponse;
	import com.yile.games.doll.net.response.item.SellItemResponse;
	import com.yile.games.doll.net.response.item.SendGiftItemResponse;
	import com.yile.games.doll.net.response.item.GiftPacksResponse;
	import com.yile.games.doll.net.response.item.GetGiftPackItemResponse;
	import com.yile.games.doll.net.response.item.DeleteGiftPackResponse;
	import com.yile.games.doll.net.response.item.ViewItemDetailInfoResponse;
	import com.yile.games.doll.net.response.item.MainPackSpaceResponse;
	import com.yile.games.doll.net.response.item.UnlockMainPackSpaceResponse;
	import com.yile.games.doll.net.response.item.SetHeroStateResponse;
	import com.yile.games.doll.net.response.item.LeechdomEffectResponse;
	import com.yile.games.doll.net.response.item.StoneTransformResponse;
	import com.yile.games.doll.net.response.item.ReqReputationListResponse;
	import com.yile.games.doll.net.response.item.ReqBuyReputationItemResponse;
	import com.yile.games.doll.net.response.item.GetFusionItemResponse;
	import com.yile.games.doll.net.response.item.GetRandomBoxResponse;
	import com.yile.games.doll.net.response.item.MediaKeyRewardResponse;
	import com.yile.games.doll.net.response.item.DecomposeItemsResponse;
	import com.yile.games.doll.net.response.quest.GetQuestResponse;
	import com.yile.games.doll.net.response.quest.UpdateQuestResponse;
	import com.yile.games.doll.net.response.quest.AcceptQuestResponse;
	import com.yile.games.doll.net.response.quest.QuitQuestResponse;
	import com.yile.games.doll.net.response.quest.QuestFulfillNotifyResponse;
	import com.yile.games.doll.net.response.quest.QuestFinishResponse;
	import com.yile.games.doll.net.response.quest.QuestRewardNotifyResponse;
	import com.yile.games.doll.net.response.quest.NotifyQuestInfoResponse;
	import com.yile.games.doll.net.response.dare.ReqMyPkListResponse;
	import com.yile.games.doll.net.response.dare.ReqMyPkInfoResponse;
	import com.yile.games.doll.net.response.dare.ReqMyPkLogResponse;
	import com.yile.games.doll.net.response.dare.UserPkRankingResponse;
	import com.yile.games.doll.net.response.dare.ReqMyPkRewardInfoResponse;
	import com.yile.games.doll.net.response.dare.GetPkRewardResponse;
	import com.yile.games.doll.net.response.dare.ReqStartPkResponse;
	import com.yile.games.doll.net.response.dare.ReqUpdateCountAndCdResponse;
	import com.yile.games.doll.net.response.dare.NotifyLeaveDareResponse;
	import com.yile.games.doll.net.response.dare.ReqDareStateResponse;
	import com.yile.games.doll.net.response.dare.ReqMyActivitisResponse;
	import com.yile.games.doll.net.response.dare.DareMatchGmaeResponse;
	import com.yile.games.doll.net.response.dare.EnterDareResultResponse;
	import com.yile.games.doll.net.response.dare.NotifyDareCountDownResponse;
	import com.yile.games.doll.net.response.dare.SystemNoticeResponse;
	import com.yile.games.doll.net.response.resource.TreasureListInfoResponse;
	import com.yile.games.doll.net.response.resource.SearchTreasureInfoResponse;
	import com.yile.games.doll.net.response.resource.SearchTreasureLogInfoResponse;
	import com.yile.games.doll.net.response.home.EnterHomeResponse;
	import com.yile.games.doll.net.response.home.OpenFunctionListResponse;
	import com.yile.games.doll.net.response.home.TrainHeroListResponse;
	import com.yile.games.doll.net.response.home.TrainHeroResponse;
	import com.yile.games.doll.net.response.home.OpenTrainBaseResponse;
	import com.yile.games.doll.net.response.home.SpeedUpTrainHeroResponse;
	import com.yile.games.doll.net.response.home.SearchZoneListResponse;
	import com.yile.games.doll.net.response.home.SetSearchStateResponse;
	import com.yile.games.doll.net.response.home.SearchFoundResponse;
	import com.yile.games.doll.net.response.home.TrainSoulListResponse;
	import com.yile.games.doll.net.response.home.SetTrainSoulStateResponse;
	import com.yile.games.doll.net.response.home.TrainSoulProductResponse;
	import com.yile.games.doll.net.response.home.SpeedUpTrainSoulResponse;
	import com.yile.games.doll.net.response.home.PickUpSoulResponse;
	import com.yile.games.doll.net.response.home.ReqBirdInfoResponse;
	import com.yile.games.doll.net.response.home.FeedBirdResponse;
	import com.yile.games.doll.net.response.home.GodLikeResponse;
	import com.yile.games.doll.net.response.home.BlessGodResponse;
	import com.yile.games.doll.net.response.home.ReqBlessLogResponse;
	import com.yile.games.doll.net.response.home.ReqBlessRewardListResponse;
	import com.yile.games.doll.net.response.home.ReqBlessRewardResponse;
	import com.yile.games.doll.net.response.home.ReqStealSoulResponse;
	import com.yile.games.doll.net.response.home.ReqStealSoulListResponse;
	import com.yile.games.doll.net.response.quiz.QuestionQuizResponse;
	import com.yile.games.doll.net.response.quiz.AnswerQuizResponse;
	import com.yile.games.doll.net.response.quiz.QuizPosListResponse;
	import com.yile.games.doll.net.response.mail.ReqSendMailResponse;
	import com.yile.games.doll.net.response.mail.ReqGetListMailResponse;
	import com.yile.games.doll.net.response.mail.ReqOpenMailResponse;
	import com.yile.games.doll.net.response.mail.ReqGetItemMailResponse;
	import com.yile.games.doll.net.response.mail.ReqDelMailResponse;
	import com.yile.games.doll.net.response.mail.NotifyNewMailResponse;
	import com.yile.games.doll.net.request.system.LoginRequest;
	import com.yile.games.doll.net.request.system.LoginGateRequest;
	import com.yile.games.doll.net.request.system.VisitorLoginRequest;
	import com.yile.games.doll.net.request.system.ReloginRequest;
	import com.yile.games.doll.net.request.system.ReloadConfigRequest;
	import com.yile.games.doll.net.request.system.KickUserOutNotifyRequest;
	import com.yile.games.doll.net.request.user.UserRoleListRequest;
	import com.yile.games.doll.net.request.user.CreateRoleRequest;
	import com.yile.games.doll.net.request.user.LoginRoleRequest;
	import com.yile.games.doll.net.request.user.RemoveRoleRequest;
	import com.yile.games.doll.net.request.user.ReqUserInfoRequest;
	import com.yile.games.doll.net.request.user.UserSkillListRequest;
	import com.yile.games.doll.net.request.user.AddUserSkillRequest;
	import com.yile.games.doll.net.request.user.ConfigUserSkillRequest;
	import com.yile.games.doll.net.request.user.UpgradeUserSkillRequest;
	import com.yile.games.doll.net.request.user.OfflineMsgRequest;
	import com.yile.games.doll.net.request.user.UpdateMoneyNotifyRequest;
	import com.yile.games.doll.net.request.user.EnableInstanceMapRequest;
	import com.yile.games.doll.net.request.user.UserObtainExpRequest;
	import com.yile.games.doll.net.request.user.ObtainPetInfoParaRequest;
	import com.yile.games.doll.net.request.user.ReqOtherUserInfoRequest;
	import com.yile.games.doll.net.request.user.InviteGameResultRequest;
	import com.yile.games.doll.net.request.user.DailyTaskListRequest;
	import com.yile.games.doll.net.request.user.UpdateDailyTaskRequest;
	import com.yile.games.doll.net.request.user.DailyTaskRewardListRequest;
	import com.yile.games.doll.net.request.user.ReqDailyTaskRewardRequest;
	import com.yile.games.doll.net.request.user.UpgradeObtainPetRequest;
	import com.yile.games.doll.net.request.user.ReqForbidInstanceTimeRequest;
	import com.yile.games.doll.net.request.user.GodmodePlayListRequest;
	import com.yile.games.doll.net.request.user.RefreshGodmodeRequest;
	import com.yile.games.doll.net.request.user.RecharegeMoneyParaRequest;
	import com.yile.games.doll.net.request.user.UserVipInfoRequest;
	import com.yile.games.doll.net.request.user.NewGuideNotifyRequest;
	import com.yile.games.doll.net.request.user.NewGuideDoneRequest;
	import com.yile.games.doll.net.request.user.SaveCustomDataRequest;
	import com.yile.games.doll.net.request.user.ReqCustomDataRequest;
	import com.yile.games.doll.net.request.user.ReqSystemSettingsRequest;
	import com.yile.games.doll.net.request.user.SetSystemSettingsRequest;
	import com.yile.games.doll.net.request.user.UserCollectRewardRequest;
	import com.yile.games.doll.net.request.user.KeepGameRewardRequest;
	import com.yile.games.doll.net.request.user.GodSealInfoRequest;
	import com.yile.games.doll.net.request.user.ReleaseGodSealRequest;
	import com.yile.games.doll.net.request.user.GodCtrlInfoRequest;
	import com.yile.games.doll.net.request.user.RaiseGodCtrlInfoRequest;
	import com.yile.games.doll.net.request.user.ResetGodCtrlInfoRequest;
	import com.yile.games.doll.net.request.user.UserCollectRewardInfoRequest;
	import com.yile.games.doll.net.request.user.DeployFightObjectRequest;
	import com.yile.games.doll.net.request.user.ReqRewardInstanceListRequest;
	import com.yile.games.doll.net.request.user.RefreshRewardInstanceRequest;
	import com.yile.games.doll.net.request.user.FightObjectInfoRequest;
	import com.yile.games.doll.net.request.user.DramaListRequest;
	import com.yile.games.doll.net.request.user.AddDramaRequest;
	import com.yile.games.doll.net.request.user.SaveUiOpenRequest;
	import com.yile.games.doll.net.request.user.UiOpenListRequest;
	import com.yile.games.doll.net.request.user.MyMopUpInfoRequest;
	import com.yile.games.doll.net.request.user.StartMopUpRequest;
	import com.yile.games.doll.net.request.user.MopUpResultRequest;
	import com.yile.games.doll.net.request.user.GetVipGiftpackRequest;
	import com.yile.games.doll.net.request.user.CancelAddictRequest;
	import com.yile.games.doll.net.request.user.ActivityRankRewardRequest;
	import com.yile.games.doll.net.request.user.UserFightbossInfoRequest;
	import com.yile.games.doll.net.request.user.UserFightbossRewardRequest;
	import com.yile.games.doll.net.request.user.ReqEventInstanceListRequest;
	import com.yile.games.doll.net.request.user.ReqCapitalActiveStateRequest;
	import com.yile.games.doll.net.request.user.RechargeFeedbackStateRequest;
	import com.yile.games.doll.net.request.user.ReqFeedbackGiftpackInfoRequest;
	import com.yile.games.doll.net.request.user.FirstRechargeStateInfoRequest;
	import com.yile.games.doll.net.request.user.FirstRechargeRewardInfoRequest;
	import com.yile.games.doll.net.request.user.UserConsumeInfoRequest;
	import com.yile.games.doll.net.request.user.ConsumeLotteryInfoRequest;
	import com.yile.games.doll.net.request.user.ActiveLoginInfoRequest;
	import com.yile.games.doll.net.request.user.GiftPackRewardListRequest;
	import com.yile.games.doll.net.request.user.GetGiftPackRewardRequest;
	import com.yile.games.doll.net.request.user.HoldOnlineRequest;
	import com.yile.games.doll.net.request.user.HoldOnlineTimerRequest;
	import com.yile.games.doll.net.request.user.CancelHoldOnlineRequest;
	import com.yile.games.doll.net.request.user.MyNpcRaceInfoRequest;
	import com.yile.games.doll.net.request.user.NpcRaceListRequest;
	import com.yile.games.doll.net.request.user.NpcRaceBetRequest;
	import com.yile.games.doll.net.request.user.NpcRaceStateRequest;
	import com.yile.games.doll.net.request.time.TimeRequest;
	import com.yile.games.doll.net.request.hall.CreateRoomRequest;
	import com.yile.games.doll.net.request.hall.HallroomListRequest;
	import com.yile.games.doll.net.request.hall.RoomInfoRequest;
	import com.yile.games.doll.net.request.hall.EnterRoomRequest;
	import com.yile.games.doll.net.request.hall.LeaveRoomRequest;
	import com.yile.games.doll.net.request.hall.KickUserOutroomRequest;
	import com.yile.games.doll.net.request.hall.UpdateRoleRequest;
	import com.yile.games.doll.net.request.hall.HallUserStateRequest;
	import com.yile.games.doll.net.request.hall.ChangeGameInstanceRequest;
	import com.yile.games.doll.net.request.hall.InviteRelationIntoGameRequest;
	import com.yile.games.doll.net.request.hall.StartGameRequest;
	import com.yile.games.doll.net.request.hall.QuickJoinGameRequest;
	import com.yile.games.doll.net.request.hall.UserLevelRankingRequest;
	import com.yile.games.doll.net.request.hall.UserWealthRankingRequest;
	import com.yile.games.doll.net.request.hall.UserCombatRankingRequest;
	import com.yile.games.doll.net.request.hall.UnionLevelRankingRequest;
	import com.yile.games.doll.net.request.hall.AutoEnterGameRequest;
	import com.yile.games.doll.net.request.hall.ReqMyRankingRequest;
	import com.yile.games.doll.net.request.hall.SetRoomStateRequest;
	import com.yile.games.doll.net.request.hall.UpdateRoomStateRequest;
	import com.yile.games.doll.net.request.hall.MatchGameRequest;
	import com.yile.games.doll.net.request.hall.CreateTeamInfoRequest;
	import com.yile.games.doll.net.request.hall.TeamDetailInfoRequest;
	import com.yile.games.doll.net.request.hall.TeamListInfoRequest;
	import com.yile.games.doll.net.request.hall.KickTeamUserInfoRequest;
	import com.yile.games.doll.net.request.hall.EnterTeamRequest;
	import com.yile.games.doll.net.request.hall.LeaveTeamRequest;
	import com.yile.games.doll.net.request.hall.TeamReadyGameRequest;
	import com.yile.games.doll.net.request.scene.EnterCopyMapRequest;
	import com.yile.games.doll.net.request.scene.EnterStationMapRequest;
	import com.yile.games.doll.net.request.scene.LeaveMapRequest;
	import com.yile.games.doll.net.request.scene.BatchAddUserRequest;
	import com.yile.games.doll.net.request.scene.MoveRequest;
	import com.yile.games.doll.net.request.scene.DeleteMapDataRequest;
	import com.yile.games.doll.net.request.scene.AddUserRequest;
	import com.yile.games.doll.net.request.scene.BatchRemoveMapDataRequest;
	import com.yile.games.doll.net.request.scene.ChangeMapRequest;
	import com.yile.games.doll.net.request.scene.UserObjectInfoRequest;
	import com.yile.games.doll.net.request.scene.PetInfoRequest;
	import com.yile.games.doll.net.request.scene.ScenePetInfoRequest;
	import com.yile.games.doll.net.request.scene.SceneUserInfoRequest;
	import com.yile.games.doll.net.request.scene.GoldMineRequest;
	import com.yile.games.doll.net.request.scene.DoorStateRequest;
	import com.yile.games.doll.net.request.scene.EndofInitRequest;
	import com.yile.games.doll.net.request.scene.SelectAttackNpcRequest;
	import com.yile.games.doll.net.request.scene.UpgradeNpcRequest;
	import com.yile.games.doll.net.request.scene.AttackStartRequest;
	import com.yile.games.doll.net.request.scene.MagicSwitchRequest;
	import com.yile.games.doll.net.request.scene.SetStateRequest;
	import com.yile.games.doll.net.request.scene.ClearStateRequest;
	import com.yile.games.doll.net.request.scene.SetHpRequest;
	import com.yile.games.doll.net.request.scene.DeathNotifyRequest;
	import com.yile.games.doll.net.request.scene.ReliveMapDataRequest;
	import com.yile.games.doll.net.request.scene.NpcLeaveNotifyRequest;
	import com.yile.games.doll.net.request.scene.GameResultNotifyRequest;
	import com.yile.games.doll.net.request.scene.ResourcePetInfoRequest;
	import com.yile.games.doll.net.request.scene.ResourcePetProductRequest;
	import com.yile.games.doll.net.request.scene.GetPetResourceRequest;
	import com.yile.games.doll.net.request.scene.BackOffStateRequest;
	import com.yile.games.doll.net.request.scene.SetSceneEffectRequest;
	import com.yile.games.doll.net.request.scene.SetTargetPetRequest;
	import com.yile.games.doll.net.request.scene.ChangeDoorStateRequest;
	import com.yile.games.doll.net.request.scene.ToggleDoorRequest;
	import com.yile.games.doll.net.request.scene.ToggleDoorNotifyOtherRequest;
	import com.yile.games.doll.net.request.scene.AddMapItemRequest;
	import com.yile.games.doll.net.request.scene.PickUpItemRequest;
	import com.yile.games.doll.net.request.scene.RightNowGameOverRequest;
	import com.yile.games.doll.net.request.scene.GotoRequest;
	import com.yile.games.doll.net.request.scene.SceneDpsListRequest;
	import com.yile.games.doll.net.request.scene.PlayBackgroundMusicRequest;
	import com.yile.games.doll.net.request.scene.LoadingProgressNotifyRequest;
	import com.yile.games.doll.net.request.chat.ChannelChatRequest;
	import com.yile.games.doll.net.request.chat.SysNotifyRequest;
	import com.yile.games.doll.net.request.union.UnionListInfoRequest;
	import com.yile.games.doll.net.request.union.UnionDetailInfoRequest;
	import com.yile.games.doll.net.request.union.UnionMemberInfoRequest;
	import com.yile.games.doll.net.request.union.ApplyInfoRequest;
	import com.yile.games.doll.net.request.union.CreateUnionRequest;
	import com.yile.games.doll.net.request.union.ApplyJoinRequest;
	import com.yile.games.doll.net.request.union.ApplyQuitRequest;
	import com.yile.games.doll.net.request.union.ApplyListRequest;
	import com.yile.games.doll.net.request.union.AllowApplyRequest;
	import com.yile.games.doll.net.request.union.ChangePowerRequest;
	import com.yile.games.doll.net.request.union.ChangeNoticeRequest;
	import com.yile.games.doll.net.request.union.ChangeLeaderRequest;
	import com.yile.games.doll.net.request.union.RemoveMemberRequest;
	import com.yile.games.doll.net.request.union.ChangeUnionStateRequest;
	import com.yile.games.doll.net.request.union.DissolveUnionRequest;
	import com.yile.games.doll.net.request.union.DonateUnionParaRequest;
	import com.yile.games.doll.net.request.union.UpgradeBaseInfoRequest;
	import com.yile.games.doll.net.request.union.UnionLotteryContentRequest;
	import com.yile.games.doll.net.request.union.UnionLotteryRequest;
	import com.yile.games.doll.net.request.union.UnionBuyObjectRequest;
	import com.yile.games.doll.net.request.union.UnionBaseBuildInfoRequest;
	import com.yile.games.doll.net.request.union.UnionAdvInfoRequest;
	import com.yile.games.doll.net.request.union.UnionMemberDpsRankInfoRequest;
	import com.yile.games.doll.net.request.union.UnionLotteryStopRequest;
	import com.yile.games.doll.net.request.union.UnionScoreRankRequest;
	import com.yile.games.doll.net.request.union.MemberScoreInfoRequest;
	import com.yile.games.doll.net.request.union.ReqUserJionUnionRequest;
	import com.yile.games.doll.net.request.union.InviteUnionAnswerRequest;
	import com.yile.games.doll.net.request.state.AddStateRequest;
	import com.yile.games.doll.net.request.state.GetUserStatesRequest;
	import com.yile.games.doll.net.request.state.RemoveStateRequest;
	import com.yile.games.doll.net.request.state.UpdateStateRequest;
	import com.yile.games.doll.net.request.general.ToOtherUserRequest;
	import com.yile.games.doll.net.request.relation.SendRelationListRequest;
	import com.yile.games.doll.net.request.relation.UpdateRelationStateRequest;
	import com.yile.games.doll.net.request.relation.RelationInteractionRequest;
	import com.yile.games.doll.net.request.relation.AddBadRelationRequest;
	import com.yile.games.doll.net.request.relation.RemoveRelationRequest;
	import com.yile.games.doll.net.request.item.AddItemListRequest;
	import com.yile.games.doll.net.request.item.UpdateItemRequest;
	import com.yile.games.doll.net.request.item.RemoveItemRequest;
	import com.yile.games.doll.net.request.item.SwapMoveItemRequest;
	import com.yile.games.doll.net.request.item.SplitItemRequest;
	import com.yile.games.doll.net.request.item.UseItemRequest;
	import com.yile.games.doll.net.request.item.PackupItemRequest;
	import com.yile.games.doll.net.request.item.ChangeItemRequest;
	import com.yile.games.doll.net.request.item.SaveEnchancePropertyRequest;
	import com.yile.games.doll.net.request.item.EquipGridInfoRequest;
	import com.yile.games.doll.net.request.item.EquipGridUpgradeRequest;
	import com.yile.games.doll.net.request.item.HeroDetailInfoRequest;
	import com.yile.games.doll.net.request.item.EnableRebuildSkillsRequest;
	import com.yile.games.doll.net.request.item.RebuildHeroRequest;
	import com.yile.games.doll.net.request.item.UpgradeHeroQualityRequest;
	import com.yile.games.doll.net.request.item.UpgradeHeroSpeedRequest;
	import com.yile.games.doll.net.request.item.UpgradeHeroRequest;
	import com.yile.games.doll.net.request.item.BuyItemRequest;
	import com.yile.games.doll.net.request.item.SellItemRequest;
	import com.yile.games.doll.net.request.item.SendGiftItemRequest;
	import com.yile.games.doll.net.request.item.GiftPacksRequest;
	import com.yile.games.doll.net.request.item.GetGiftPackItemRequest;
	import com.yile.games.doll.net.request.item.DeleteGiftPackRequest;
	import com.yile.games.doll.net.request.item.ViewItemDetailInfoRequest;
	import com.yile.games.doll.net.request.item.MainPackSpaceRequest;
	import com.yile.games.doll.net.request.item.UnlockMainPackSpaceRequest;
	import com.yile.games.doll.net.request.item.SetHeroStateRequest;
	import com.yile.games.doll.net.request.item.LeechdomEffectRequest;
	import com.yile.games.doll.net.request.item.StoneTransformRequest;
	import com.yile.games.doll.net.request.item.ReqReputationListRequest;
	import com.yile.games.doll.net.request.item.ReqBuyReputationItemRequest;
	import com.yile.games.doll.net.request.item.GetFusionItemRequest;
	import com.yile.games.doll.net.request.item.GetRandomBoxRequest;
	import com.yile.games.doll.net.request.item.MediaKeyRewardRequest;
	import com.yile.games.doll.net.request.item.DecomposeItemsRequest;
	import com.yile.games.doll.net.request.quest.GetQuestRequest;
	import com.yile.games.doll.net.request.quest.UpdateQuestRequest;
	import com.yile.games.doll.net.request.quest.AcceptQuestRequest;
	import com.yile.games.doll.net.request.quest.QuitQuestRequest;
	import com.yile.games.doll.net.request.quest.QuestFinishRequest;
	import com.yile.games.doll.net.request.quest.NotifyQuestInfoRequest;
	import com.yile.games.doll.net.request.dare.ReqMyPkListRequest;
	import com.yile.games.doll.net.request.dare.ReqMyPkInfoRequest;
	import com.yile.games.doll.net.request.dare.ReqMyPkLogRequest;
	import com.yile.games.doll.net.request.dare.UserPkRankingRequest;
	import com.yile.games.doll.net.request.dare.ReqMyPkRewardInfoRequest;
	import com.yile.games.doll.net.request.dare.GetPkRewardRequest;
	import com.yile.games.doll.net.request.dare.ReqStartPkRequest;
	import com.yile.games.doll.net.request.dare.ReqUpdateCountAndCdRequest;
	import com.yile.games.doll.net.request.dare.NotifyLeaveDareRequest;
	import com.yile.games.doll.net.request.dare.ReqDareStateRequest;
	import com.yile.games.doll.net.request.dare.ReqMyActivitisRequest;
	import com.yile.games.doll.net.request.dare.DareMatchGmaeRequest;
	import com.yile.games.doll.net.request.dare.EnterDareResultRequest;
	import com.yile.games.doll.net.request.dare.NotifyDareCountDownRequest;
	import com.yile.games.doll.net.request.dare.SystemNoticeRequest;
	import com.yile.games.doll.net.request.resource.TreasureListInfoRequest;
	import com.yile.games.doll.net.request.resource.SearchTreasureInfoRequest;
	import com.yile.games.doll.net.request.resource.SearchTreasureLogInfoRequest;
	import com.yile.games.doll.net.request.home.EnterHomeRequest;
	import com.yile.games.doll.net.request.home.OpenFunctionListRequest;
	import com.yile.games.doll.net.request.home.TrainHeroListRequest;
	import com.yile.games.doll.net.request.home.TrainHeroRequest;
	import com.yile.games.doll.net.request.home.OpenTrainBaseRequest;
	import com.yile.games.doll.net.request.home.SpeedUpTrainHeroRequest;
	import com.yile.games.doll.net.request.home.SearchZoneListRequest;
	import com.yile.games.doll.net.request.home.SetSearchStateRequest;
	import com.yile.games.doll.net.request.home.SearchFoundRequest;
	import com.yile.games.doll.net.request.home.TrainSoulListRequest;
	import com.yile.games.doll.net.request.home.SetTrainSoulStateRequest;
	import com.yile.games.doll.net.request.home.TrainSoulProductRequest;
	import com.yile.games.doll.net.request.home.SpeedUpTrainSoulRequest;
	import com.yile.games.doll.net.request.home.PickUpSoulRequest;
	import com.yile.games.doll.net.request.home.ReqBirdInfoRequest;
	import com.yile.games.doll.net.request.home.FeedBirdRequest;
	import com.yile.games.doll.net.request.home.GodLikeRequest;
	import com.yile.games.doll.net.request.home.BlessGodRequest;
	import com.yile.games.doll.net.request.home.ReqBlessLogRequest;
	import com.yile.games.doll.net.request.home.ReqBlessRewardListRequest;
	import com.yile.games.doll.net.request.home.ReqBlessRewardRequest;
	import com.yile.games.doll.net.request.home.ReqStealSoulRequest;
	import com.yile.games.doll.net.request.home.ReqStealSoulListRequest;
	import com.yile.games.doll.net.request.quiz.QuestionQuizRequest;
	import com.yile.games.doll.net.request.quiz.AnswerQuizRequest;
	import com.yile.games.doll.net.request.quiz.QuizPosListRequest;
	import com.yile.games.doll.net.request.mail.ReqSendMailRequest;
	import com.yile.games.doll.net.request.mail.ReqGetListMailRequest;
	import com.yile.games.doll.net.request.mail.ReqOpenMailRequest;
	import com.yile.games.doll.net.request.mail.ReqGetItemMailRequest;
	import com.yile.games.doll.net.request.mail.ReqDelMailRequest;
	import com.yile.games.doll.net.request.mail.NotifyNewMailRequest;
	public class Protocol implements IProtocol
	{
		private static var _protoMap:Object = {
		
		};
		
		/**
		 * 登录到登陆服返回结果
		 */
		public static const LOGIN:Object = {
			module: 1,
			action: 2, request:LoginRequest//
		};
		
		/**
		 * 登录到网关返回结果
		 */
		public static const LOGIN_GATE:Object = {
			module: 1,
			action: 4, request:LoginGateRequest//
		};
		
		/**
		 * 游客登录到系统返回结果
		 */
		public static const VISITOR_LOGIN:Object = {
			module: 1,
			action: 6, request:VisitorLoginRequest//
		};
		
		/**
		 * 断线重连
		 */
		public static const RELOGIN:Object = {
			module: 1,
			action: 8, request:ReloginRequest//
		};
		
		/**
		 * 刷新配置文件
		 */
		public static const RELOAD_CONFIG:Object = {
			module: 1,
			action: 10, request:ReloadConfigRequest//
		};
		
		/**
		 * 踢人下线
		 */
		public static const KICK_USER_OUT_NOTIFY:Object = {
			module: 1,
			action: 12, request:KickUserOutNotifyRequest//
		};
		
		/**
		 * 请求账号角色列表
		 */
		public static const USER_ROLE_LIST:Object = {
			module: 2,
			action: 2, request:UserRoleListRequest//
		};
		
		/**
		 * 创建角色返回
		 */
		public static const CREATE_ROLE:Object = {
			module: 2,
			action: 4, request:CreateRoleRequest//
		};
		
		/**
		 * 登陆选择的角色ID返回
		 */
		public static const LOGIN_ROLE:Object = {
			module: 2,
			action: 6, request:LoginRoleRequest//
		};
		
		/**
		 * 删除角色返回
		 */
		public static const REMOVE_ROLE:Object = {
			module: 2,
			action: 8, request:RemoveRoleRequest//
		};
		
		/**
		 * 查询角色基本信息
		 */
		public static const REQ_USER_INFO:Object = {
			module: 2,
			action: 10, request:ReqUserInfoRequest//
		};
		
		/**
		 * 玩家技能列表
		 */
		public static const USER_SKILL_LIST:Object = {
			module: 2,
			action: 12, request:UserSkillListRequest//
		};
		
		/**
		 * 新技能添加
		 */
		public static const ADD_USER_SKILL:Object = {
			module: 2,
			action: 14, request:AddUserSkillRequest//
		};
		
		/**
		 * 技能配置
		 */
		public static const CONFIG_USER_SKILL:Object = {
			module: 2,
			action: 16, request:ConfigUserSkillRequest//
		};
		
		/**
		 * 技能升级
		 */
		public static const UPGRADE_USER_SKILL:Object = {
			module: 2,
			action: 18, request:UpgradeUserSkillRequest//
		};
		
		/**
		 * 请求自己的离线消息
		 */
		public static const OFFLINE_MSG:Object = {
			module: 2,
			action: 20, request:OfflineMsgRequest//
		};
		
		/**
		 * 金钱变更通知
		 */
		public static const UPDATE_MONEY_NOTIFY:Object = {
			module: 2,
			action: 22, request:UpdateMoneyNotifyRequest//
		};
		
		/**
		 * 查询已完成副本地图返回
		 */
		public static const ENABLE_INSTANCE_MAP:Object = {
			module: 2,
			action: 24, request:EnableInstanceMapRequest//
		};
		
		/**
		 * 用户获得经验
		 */
		public static const USER_OBTAIN_EXP:Object = {
			module: 2,
			action: 26, request:UserObtainExpRequest//
		};
		
		/**
		 * 获得的宠物信息返回
		 */
		public static const OBTAIN_PET_INFO_PARA:Object = {
			module: 2,
			action: 28, request:ObtainPetInfoParaRequest//
		};
		
		/**
		 * 查询其他角色信息
		 */
		public static const REQ_OTHER_USER_INFO:Object = {
			module: 2,
			action: 30, request:ReqOtherUserInfoRequest//
		};
		
		/**
		 * 邀请游戏应答
		 */
		public static const INVITE_GAME_RESULT:Object = {
			module: 2,
			action: 32, request:InviteGameResultRequest//
		};
		
		/**
		 * 日常任务列表
		 */
		public static const DAILY_TASK_LIST:Object = {
			module: 2,
			action: 34, request:DailyTaskListRequest//
		};
		
		/**
		 * 更新日常任务
		 */
		public static const UPDATE_DAILY_TASK:Object = {
			module: 2,
			action: 36, request:UpdateDailyTaskRequest//
		};
		
		/**
		 * 日常任务领奖列表
		 */
		public static const DAILY_TASK_REWARD_LIST:Object = {
			module: 2,
			action: 38, request:DailyTaskRewardListRequest//
		};
		
		/**
		 * 日常任务领奖
		 */
		public static const REQ_DAILY_TASK_REWARD:Object = {
			module: 2,
			action: 40, request:ReqDailyTaskRewardRequest//
		};
		
		/**
		 * 小兵升级 + 转生
		 */
		public static const UPGRADE_OBTAIN_PET:Object = {
			module: 2,
			action: 42, request:UpgradeObtainPetRequest//
		};
		
		/**
		 * 查询角色禁止进入副本时间
		 */
		public static const REQ_FORBID_INSTANCE_TIME:Object = {
			module: 2,
			action: 44, request:ReqForbidInstanceTimeRequest//
		};
		
		/**
		 * 查询已挑战副本返回
		 */
		public static const GODMODE_PLAY_LIST:Object = {
			module: 2,
			action: 46, request:GodmodePlayListRequest//
		};
		
		/**
		 * 请求刷新神之挑战模式返回
		 */
		public static const REFRESH_GODMODE:Object = {
			module: 2,
			action: 48, request:RefreshGodmodeRequest//
		};
		
		/**
		 * 用户充值返回
		 */
		public static const RECHAREGE_MONEY_PARA:Object = {
			module: 2,
			action: 50, request:RecharegeMoneyParaRequest//
		};
		
		/**
		 * 用户vip信息
		 */
		public static const USER_VIP_INFO:Object = {
			module: 2,
			action: 52, request:UserVipInfoRequest//
		};
		
		/**
		 * 新手引导开启通知
		 */
		public static const NEW_GUIDE_NOTIFY:Object = {
			module: 2,
			action: 54, request:NewGuideNotifyRequest//
		};
		
		/**
		 * 新手引导完成
		 */
		public static const NEW_GUIDE_DONE:Object = {
			module: 2,
			action: 56, request:NewGuideDoneRequest//
		};
		
		/**
		 * 保存一些自定义数据
		 */
		public static const SAVE_CUSTOM_DATA:Object = {
			module: 2,
			action: 58, request:SaveCustomDataRequest//
		};
		
		/**
		 * 查询自定义数据
		 */
		public static const REQ_CUSTOM_DATA:Object = {
			module: 2,
			action: 60, request:ReqCustomDataRequest//
		};
		
		/**
		 * 查询系统设置
		 */
		public static const REQ_SYSTEM_SETTINGS:Object = {
			module: 2,
			action: 62, request:ReqSystemSettingsRequest//
		};
		
		/**
		 * 系统设置
		 */
		public static const SET_SYSTEM_SETTINGS:Object = {
			module: 2,
			action: 64, request:SetSystemSettingsRequest//
		};
		
		/**
		 * 用户技能收集奖励领取
		 */
		public static const USER_COLLECT_REWARD:Object = {
			module: 2,
			action: 66, request:UserCollectRewardRequest//
		};
		
		/**
		 * 保留游戏掉落道具
		 */
		public static const KEEP_GAME_REWARD:Object = {
			module: 2,
			action: 68, request:KeepGameRewardRequest//
		};
		
		/**
		 * 神之封印属性加成信息
		 */
		public static const GOD_SEAL_INFO:Object = {
			module: 2,
			action: 70, request:GodSealInfoRequest//
		};
		
		/**
		 * 解除神之封印
		 */
		public static const RELEASE_GOD_SEAL:Object = {
			module: 2,
			action: 72, request:ReleaseGodSealRequest//
		};
		
		/**
		 * 御神器信息
		 */
		public static const GOD_CTRL_INFO:Object = {
			module: 2,
			action: 74, request:GodCtrlInfoRequest//
		};
		
		/**
		 * 御神器修炼
		 */
		public static const RAISE_GOD_CTRL_INFO:Object = {
			module: 2,
			action: 76, request:RaiseGodCtrlInfoRequest//
		};
		
		/**
		 * 重置御神器
		 */
		public static const RESET_GOD_CTRL_INFO:Object = {
			module: 2,
			action: 78, request:ResetGodCtrlInfoRequest//
		};
		
		/**
		 * 用户技能收集奖励领取信息
		 */
		public static const USER_COLLECT_REWARD_INFO:Object = {
			module: 2,
			action: 80, request:UserCollectRewardInfoRequest//
		};
		
		/**
		 * 配置战斗道具
		 */
		public static const DEPLOY_FIGHT_OBJECT:Object = {
			module: 2,
			action: 82, request:DeployFightObjectRequest//
		};
		
		/**
		 * 请求悬赏副本信息
		 */
		public static const REQ_REWARD_INSTANCE_LIST:Object = {
			module: 2,
			action: 84, request:ReqRewardInstanceListRequest//
		};
		
		/**
		 * 刷新当前区域的悬赏副本
		 */
		public static const REFRESH_REWARD_INSTANCE:Object = {
			module: 2,
			action: 86, request:RefreshRewardInstanceRequest//
		};
		
		/**
		 * 战斗道具信息
		 */
		public static const FIGHT_OBJECT_INFO:Object = {
			module: 2,
			action: 88, request:FightObjectInfoRequest//
		};
		
		/**
		 * 播放过的剧情列表
		 */
		public static const DRAMA_LIST:Object = {
			module: 2,
			action: 90, request:DramaListRequest//
		};
		
		/**
		 * 添加剧情
		 */
		public static const ADD_DRAMA:Object = {
			module: 2,
			action: 92, request:AddDramaRequest//
		};
		
		/**
		 * 保存开启ui
		 */
		public static const SAVE_UI_OPEN:Object = {
			module: 2,
			action: 94, request:SaveUiOpenRequest//
		};
		
		/**
		 * 开启ui列表
		 */
		public static const UI_OPEN_LIST:Object = {
			module: 2,
			action: 96, request:UiOpenListRequest//
		};
		
		/**
		 * 查询我的扫荡信息
		 */
		public static const MY_MOP_UP_INFO:Object = {
			module: 2,
			action: 98, request:MyMopUpInfoRequest//
		};
		
		/**
		 * 开始扫荡
		 */
		public static const START_MOP_UP:Object = {
			module: 2,
			action: 100, request:StartMopUpRequest//
		};
		
		/**
		 * 扫荡结果通知
		 */
		public static const MOP_UP_RESULT:Object = {
			module: 2,
			action: 102, request:MopUpResultRequest//
		};
		
		/**
		 * 领取VIP等级礼包
		 */
		public static const GET_VIP_GIFTPACK:Object = {
			module: 2,
			action: 104, request:GetVipGiftpackRequest//
		};
		
		/**
		 * 解除防沉迷
		 */
		public static const CANCEL_ADDICT:Object = {
			module: 2,
			action: 106, request:CancelAddictRequest//
		};
		
		/**
		 * 活动排行奖励通知
		 */
		public static const ACTIVITY_RANK_REWARD:Object = {
			module: 2,
			action: 108, request:ActivityRankRewardRequest//
		};
		
		/**
		 * 用户斗兽信息
		 */
		public static const USER_FIGHTBOSS_INFO:Object = {
			module: 2,
			action: 110, request:UserFightbossInfoRequest//
		};
		
		/**
		 * 用户斗兽信息
		 */
		public static const USER_FIGHTBOSS_REWARD:Object = {
			module: 2,
			action: 112, request:UserFightbossRewardRequest//
		};
		
		/**
		 * 请求事件副本信息
		 */
		public static const REQ_EVENT_INSTANCE_LIST:Object = {
			module: 2,
			action: 114, request:ReqEventInstanceListRequest//
		};
		
		/**
		 * 请求活动状态信息
		 */
		public static const REQ_CAPITAL_ACTIVE_STATE:Object = {
			module: 2,
			action: 116, request:ReqCapitalActiveStateRequest//
		};
		
		/**
		 * 请求充值回馈活动状态信息
		 */
		public static const RECHARGE_FEEDBACK_STATE:Object = {
			module: 2,
			action: 118, request:RechargeFeedbackStateRequest//
		};
		
		/**
		 * 请求领取充值回馈礼包信息
		 */
		public static const REQ_FEEDBACK_GIFTPACK_INFO:Object = {
			module: 2,
			action: 120, request:ReqFeedbackGiftpackInfoRequest//
		};
		
		/**
		 * 首次充值状态信息
		 */
		public static const FIRST_RECHARGE_STATE_INFO:Object = {
			module: 2,
			action: 122, request:FirstRechargeStateInfoRequest//
		};
		
		/**
		 * 请求领取首次充值礼包信息
		 */
		public static const FIRST_RECHARGE_REWARD_INFO:Object = {
			module: 2,
			action: 124, request:FirstRechargeRewardInfoRequest//
		};
		
		/**
		 * 消费信息
		 */
		public static const USER_CONSUME_INFO:Object = {
			module: 2,
			action: 126, request:UserConsumeInfoRequest//
		};
		
		/**
		 * 消费抽奖
		 */
		public static const CONSUME_LOTTERY_INFO:Object = {
			module: 2,
			action: 128, request:ConsumeLotteryInfoRequest//
		};
		
		/**
		 * 累计登录信息
		 */
		public static const ACTIVE_LOGIN_INFO:Object = {
			module: 2,
			action: 130, request:ActiveLoginInfoRequest//
		};
		
		/**
		 * 奖励礼包列表
		 */
		public static const GIFT_PACK_REWARD_LIST:Object = {
			module: 2,
			action: 132, request:GiftPackRewardListRequest//
		};
		
		/**
		 * 领取礼包奖励
		 */
		public static const GET_GIFT_PACK_REWARD:Object = {
			module: 2,
			action: 134, request:GetGiftPackRewardRequest//
		};
		
		/**
		 * 开始挂机系统
		 */
		public static const HOLD_ONLINE:Object = {
			module: 2,
			action: 136, request:HoldOnlineRequest//
		};
		
		/**
		 * 定时更新挂机信息
		 */
		public static const HOLD_ONLINE_TIMER:Object = {
			module: 2,
			action: 138, request:HoldOnlineTimerRequest//
		};
		
		/**
		 * 取消挂机
		 */
		public static const CANCEL_HOLD_ONLINE:Object = {
			module: 2,
			action: 140, request:CancelHoldOnlineRequest//
		};
		
		/**
		 * 查询我的投注信息
		 */
		public static const MY_NPC_RACE_INFO:Object = {
			module: 2,
			action: 142, request:MyNpcRaceInfoRequest//
		};
		
		/**
		 * 赛跑选手列表
		 */
		public static const NPC_RACE_LIST:Object = {
			module: 2,
			action: 144, request:NpcRaceListRequest//
		};
		
		/**
		 * 赛跑下注
		 */
		public static const NPC_RACE_BET:Object = {
			module: 2,
			action: 146, request:NpcRaceBetRequest//
		};
		
		/**
		 * 赛跑活动状态
		 */
		public static const NPC_RACE_STATE:Object = {
			module: 2,
			action: 148, request:NpcRaceStateRequest//
		};
		
		/**
		 * 客户端登录时或客户端时间不对时发送
		 */
		public static const TIME:Object = {
			module: 3,
			action: 2, request:TimeRequest//
		};
		
		/**
		 * 定时请求客户端时间
		 */
		public static const REQ_CLIENT_TIME:Object = {
			module: 3,
			action: 3//
		};
		
		/**
		 * 创建房间返回
		 */
		public static const CREATE_ROOM:Object = {
			module: 4,
			action: 2, request:CreateRoomRequest//
		};
		
		/**
		 * 请求多人副本房间列表
		 */
		public static const HALLROOM_LIST:Object = {
			module: 4,
			action: 4, request:HallroomListRequest//
		};
		
		/**
		 * 请求房间信息
		 */
		public static const ROOM_INFO:Object = {
			module: 4,
			action: 6, request:RoomInfoRequest//
		};
		
		/**
		 * 进入房间
		 */
		public static const ENTER_ROOM:Object = {
			module: 4,
			action: 8, request:EnterRoomRequest//
		};
		
		/**
		 * 离开房间
		 */
		public static const LEAVE_ROOM:Object = {
			module: 4,
			action: 10, request:LeaveRoomRequest//
		};
		
		/**
		 * 房主踢某人离开
		 */
		public static const KICK_USER_OUTROOM:Object = {
			module: 4,
			action: 12, request:KickUserOutroomRequest//
		};
		
		/**
		 * 修改房间中的角色信息
		 */
		public static const UPDATE_ROLE:Object = {
			module: 4,
			action: 14, request:UpdateRoleRequest//
		};
		
		/**
		 * 更新大厅中的角色状态
		 */
		public static const HALL_USER_STATE:Object = {
			module: 4,
			action: 16, request:HallUserStateRequest//
		};
		
		/**
		 * 更换副本返回
		 */
		public static const CHANGE_GAME_INSTANCE:Object = {
			module: 4,
			action: 18, request:ChangeGameInstanceRequest//
		};
		
		/**
		 * 邀请好友加入游戏返回
		 */
		public static const INVITE_RELATION_INTO_GAME:Object = {
			module: 4,
			action: 20, request:InviteRelationIntoGameRequest//
		};
		
		/**
		 * 邀请好友加入游戏通知
		 */
		public static const INVITE_INTO_GAME_INFO_NOTIFY:Object = {
			module: 4,
			action: 21//
		};
		
		/**
		 * 房主开始游戏
		 */
		public static const START_GAME:Object = {
			module: 4,
			action: 23, request:StartGameRequest//
		};
		
		/**
		 * 快速加入游戏返回
		 */
		public static const QUICK_JOIN_GAME:Object = {
			module: 4,
			action: 25, request:QuickJoinGameRequest//
		};
		
		/**
		 * 请求用户等级排行榜返回
		 */
		public static const USER_LEVEL_RANKING:Object = {
			module: 4,
			action: 27, request:UserLevelRankingRequest//
		};
		
		/**
		 * 请求用户财富排行榜返回
		 */
		public static const USER_WEALTH_RANKING:Object = {
			module: 4,
			action: 29, request:UserWealthRankingRequest//
		};
		
		/**
		 * 请求用户战斗力排行榜返回
		 */
		public static const USER_COMBAT_RANKING:Object = {
			module: 4,
			action: 31, request:UserCombatRankingRequest//
		};
		
		/**
		 * 请求公会等级排行榜
		 */
		public static const UNION_LEVEL_RANKING:Object = {
			module: 4,
			action: 33, request:UnionLevelRankingRequest//
		};
		
		/**
		 * 自动进入游戏
		 */
		public static const AUTO_ENTER_GAME:Object = {
			module: 4,
			action: 35, request:AutoEnterGameRequest//
		};
		
		/**
		 * 请求我的排行榜排行
		 */
		public static const REQ_MY_RANKING:Object = {
			module: 4,
			action: 37, request:ReqMyRankingRequest//
		};
		
		/**
		 * 设置房间状态
		 */
		public static const SET_ROOM_STATE:Object = {
			module: 4,
			action: 39, request:SetRoomStateRequest//
		};
		
		/**
		 * 设置房间状态
		 */
		public static const UPDATE_ROOM_STATE:Object = {
			module: 4,
			action: 41, request:UpdateRoomStateRequest//
		};
		
		/**
		 * 匹配游戏
		 */
		public static const MATCH_GAME:Object = {
			module: 4,
			action: 43, request:MatchGameRequest//
		};
		
		/**
		 * 创建队伍
		 */
		public static const CREATE_TEAM_INFO:Object = {
			module: 4,
			action: 45, request:CreateTeamInfoRequest//
		};
		
		/**
		 * 队伍信息
		 */
		public static const TEAM_DETAIL_INFO:Object = {
			module: 4,
			action: 47, request:TeamDetailInfoRequest//
		};
		
		/**
		 * 队伍列表
		 */
		public static const TEAM_LIST_INFO:Object = {
			module: 4,
			action: 49, request:TeamListInfoRequest//
		};
		
		/**
		 * 队伍踢出成员
		 */
		public static const KICK_TEAM_USER_INFO:Object = {
			module: 4,
			action: 51, request:KickTeamUserInfoRequest//
		};
		
		/**
		 * 加入队伍
		 */
		public static const ENTER_TEAM:Object = {
			module: 4,
			action: 53, request:EnterTeamRequest//
		};
		
		/**
		 * 离开队伍
		 */
		public static const LEAVE_TEAM:Object = {
			module: 4,
			action: 55, request:LeaveTeamRequest//
		};
		
		/**
		 * 队伍准备游戏
		 */
		public static const TEAM_READY_GAME:Object = {
			module: 4,
			action: 57, request:TeamReadyGameRequest//
		};
		
		/**
		 * 资源加载完成，进入副本地图
		 */
		public static const ENTER_COPY_MAP:Object = {
			module: 5,
			action: 2, request:EnterCopyMapRequest//
		};
		
		/**
		 * 进入站街地图
		 */
		public static const ENTER_STATION_MAP:Object = {
			module: 5,
			action: 4, request:EnterStationMapRequest//
		};
		
		/**
		 * 离开地图
		 */
		public static const LEAVE_MAP:Object = {
			module: 5,
			action: 6, request:LeaveMapRequest//
		};
		
		/**
		 * 批量添加人物
		 */
		public static const BATCH_ADD_USER:Object = {
			module: 5,
			action: 8, request:BatchAddUserRequest//
		};
		
		/**
		 * 移动
		 */
		public static const MOVE:Object = {
			module: 5,
			action: 10, request:MoveRequest//
		};
		
		/**
		 * 移除人物（宠物）
		 */
		public static const DELETE_MAP_DATA:Object = {
			module: 5,
			action: 12, request:DeleteMapDataRequest//
		};
		
		/**
		 * 添加人物
		 */
		public static const ADD_USER:Object = {
			module: 5,
			action: 14, request:AddUserRequest//
		};
		
		/**
		 * 批量移除人物（宠物）
		 */
		public static const BATCH_REMOVE_MAP_DATA:Object = {
			module: 5,
			action: 16, request:BatchRemoveMapDataRequest//
		};
		
		/**
		 * 切换地图
		 */
		public static const CHANGE_MAP:Object = {
			module: 5,
			action: 18, request:ChangeMapRequest//
		};
		
		/**
		 * 玩家道具信息列表
		 */
		public static const USER_OBJECT_INFO:Object = {
			module: 5,
			action: 20, request:UserObjectInfoRequest//
		};
		
		/**
		 * 操作区宠物数据
		 */
		public static const PET_INFO:Object = {
			module: 5,
			action: 22, request:PetInfoRequest//
		};
		
		/**
		 * 宠物场景数据添加及更新
		 */
		public static const SCENE_PET_INFO:Object = {
			module: 5,
			action: 24, request:ScenePetInfoRequest//
		};
		
		/**
		 * 用户场景数据更新
		 */
		public static const SCENE_USER_INFO:Object = {
			module: 5,
			action: 26, request:SceneUserInfoRequest//
		};
		
		/**
		 * 矿产（金钱）更新
		 */
		public static const GOLD_MINE:Object = {
			module: 5,
			action: 28, request:GoldMineRequest//
		};
		
		/**
		 * 传送门信息
		 */
		public static const DOOR_STATE:Object = {
			module: 5,
			action: 30, request:DoorStateRequest//
		};
		
		/**
		 * 初始化信息结束
		 */
		public static const ENDOF_INIT:Object = {
			module: 5,
			action: 32, request:EndofInitRequest//
		};
		
		/**
		 * 选择出击宠物
		 */
		public static const SELECT_ATTACK_NPC:Object = {
			module: 5,
			action: 34, request:SelectAttackNpcRequest//
		};
		
		/**
		 * 小兵升级
		 */
		public static const UPGRADE_NPC:Object = {
			module: 5,
			action: 36, request:UpgradeNpcRequest//
		};
		
		/**
		 * 攻击
		 */
		public static const ATTACK_START:Object = {
			module: 5,
			action: 38, request:AttackStartRequest//
		};
		
		/**
		 * 技能开启（切换）
		 */
		public static const MAGIC_SWITCH:Object = {
			module: 5,
			action: 40, request:MagicSwitchRequest//
		};
		
		/**
		 * 技能开始施法通知
		 */
		public static const MAGIC_ATTACK_START_RESULT:Object = {
			module: 5,
			action: 42//
		};
		
		/**
		 * 技能释放
		 */
		public static const MAGIC_ATTACK:Object = {
			module: 5,
			action: 43//
		};
		
		/**
		 * 技能释放结果
		 */
		public static const MAGIC_ATTACK_RESULT:Object = {
			module: 5,
			action: 44//
		};
		
		/**
		 * 设置状态
		 */
		public static const SET_STATE:Object = {
			module: 5,
			action: 46, request:SetStateRequest//
		};
		
		/**
		 * 取消状态
		 */
		public static const CLEAR_STATE:Object = {
			module: 5,
			action: 48, request:ClearStateRequest//
		};
		
		/**
		 * 设置生命及能量
		 */
		public static const SET_HP:Object = {
			module: 5,
			action: 50, request:SetHpRequest//
		};
		
		/**
		 * 死亡通知
		 */
		public static const DEATH_NOTIFY:Object = {
			module: 5,
			action: 52, request:DeathNotifyRequest//
		};
		
		/**
		 * 复活
		 */
		public static const RELIVE_MAP_DATA:Object = {
			module: 5,
			action: 54, request:ReliveMapDataRequest//
		};
		
		/**
		 * 英雄下场通知
		 */
		public static const NPC_LEAVE_NOTIFY:Object = {
			module: 5,
			action: 56, request:NpcLeaveNotifyRequest//
		};
		
		/**
		 * 胜利
		 */
		public static const GAME_RESULT_NOTIFY:Object = {
			module: 5,
			action: 58, request:GameResultNotifyRequest//
		};
		
		/**
		 * 资源塔信息
		 */
		public static const RESOURCE_PET_INFO:Object = {
			module: 5,
			action: 60, request:ResourcePetInfoRequest//
		};
		
		/**
		 * 资源塔产出资源
		 */
		public static const RESOURCE_PET_PRODUCT:Object = {
			module: 5,
			action: 62, request:ResourcePetProductRequest//
		};
		
		/**
		 * 拾取资源塔资源
		 */
		public static const GET_PET_RESOURCE:Object = {
			module: 5,
			action: 64, request:GetPetResourceRequest//
		};
		
		/**
		 * 位置改变
		 */
		public static const BACK_OFF_STATE:Object = {
			module: 5,
			action: 66, request:BackOffStateRequest//
		};
		
		/**
		 * 设置场景特效
		 */
		public static const SET_SCENE_EFFECT:Object = {
			module: 5,
			action: 68, request:SetSceneEffectRequest//
		};
		
		/**
		 * 强制宠物攻击目标
		 */
		public static const SET_TARGET_PET:Object = {
			module: 5,
			action: 70, request:SetTargetPetRequest//
		};
		
		/**
		 * 变更传送门状态
		 */
		public static const CHANGE_DOOR_STATE:Object = {
			module: 5,
			action: 72, request:ChangeDoorStateRequest//
		};
		
		/**
		 * 触发传送门
		 */
		public static const TOGGLE_DOOR:Object = {
			module: 5,
			action: 74, request:ToggleDoorRequest//
		};
		
		/**
		 * 触发传送门，通知其他人
		 */
		public static const TOGGLE_DOOR_NOTIFY_OTHER:Object = {
			module: 5,
			action: 76, request:ToggleDoorNotifyOtherRequest//
		};
		
		/**
		 * 物品掉落
		 */
		public static const ADD_MAP_ITEM:Object = {
			module: 5,
			action: 78, request:AddMapItemRequest//
		};
		
		/**
		 * 拾取道具
		 */
		public static const PICK_UP_ITEM:Object = {
			module: 5,
			action: 80, request:PickUpItemRequest//
		};
		
		/**
		 * 结束胜利倒计时
		 */
		public static const RIGHT_NOW_GAME_OVER:Object = {
			module: 5,
			action: 82, request:RightNowGameOverRequest//
		};
		
		/**
		 * 瞬移
		 */
		public static const GOTO:Object = {
			module: 5,
			action: 84, request:GotoRequest//
		};
		
		/**
		 * 战斗伤害输出
		 */
		public static const SCENE_DPS_LIST:Object = {
			module: 5,
			action: 86, request:SceneDpsListRequest//
		};
		
		/**
		 * 播放背景音乐
		 */
		public static const PLAY_BACKGROUND_MUSIC:Object = {
			module: 5,
			action: 88, request:PlayBackgroundMusicRequest//
		};
		
		/**
		 * 加载进度广播
		 */
		public static const LOADING_PROGRESS_NOTIFY:Object = {
			module: 5,
			action: 90, request:LoadingProgressNotifyRequest//
		};
		
		/**
		 * 聊天
		 */
		public static const CHANNEL_CHAT:Object = {
			module: 6,
			action: 2, request:ChannelChatRequest//
		};
		
		/**
		 * 系统公告
		 */
		public static const SYS_NOTIFY:Object = {
			module: 6,
			action: 4, request:SysNotifyRequest//
		};
		
		/**
		 * 请求公会列表返回
		 */
		public static const UNION_LIST_INFO:Object = {
			module: 7,
			action: 2, request:UnionListInfoRequest//
		};
		
		/**
		 * 请求公会详细信息返回
		 */
		public static const UNION_DETAIL_INFO:Object = {
			module: 7,
			action: 4, request:UnionDetailInfoRequest//
		};
		
		/**
		 * 请求公会成员信息返回
		 */
		public static const UNION_MEMBER_INFO:Object = {
			module: 7,
			action: 6, request:UnionMemberInfoRequest//
		};
		
		/**
		 * 请求本人申请加入公会信息返回
		 */
		public static const APPLY_INFO:Object = {
			module: 7,
			action: 8, request:ApplyInfoRequest//
		};
		
		/**
		 * 创建公会返回
		 */
		public static const CREATE_UNION:Object = {
			module: 7,
			action: 10, request:CreateUnionRequest//
		};
		
		/**
		 * 申请加入公会返回
		 */
		public static const APPLY_JOIN:Object = {
			module: 7,
			action: 12, request:ApplyJoinRequest//
		};
		
		/**
		 * 退出公会返回
		 */
		public static const APPLY_QUIT:Object = {
			module: 7,
			action: 14, request:ApplyQuitRequest//
		};
		
		/**
		 * 请求申请者返回
		 */
		public static const APPLY_LIST:Object = {
			module: 7,
			action: 16, request:ApplyListRequest//
		};
		
		/**
		 * 批复申请返回
		 */
		public static const ALLOW_APPLY:Object = {
			module: 7,
			action: 18, request:AllowApplyRequest//
		};
		
		/**
		 * 改变公会成员权限返回
		 */
		public static const CHANGE_POWER:Object = {
			module: 7,
			action: 20, request:ChangePowerRequest//
		};
		
		/**
		 * 改变公会公告返回
		 */
		public static const CHANGE_NOTICE:Object = {
			module: 7,
			action: 22, request:ChangeNoticeRequest//
		};
		
		/**
		 * 改变公会会长返回
		 */
		public static const CHANGE_LEADER:Object = {
			module: 7,
			action: 24, request:ChangeLeaderRequest//
		};
		
		/**
		 * 移除成员返回
		 */
		public static const REMOVE_MEMBER:Object = {
			module: 7,
			action: 26, request:RemoveMemberRequest//
		};
		
		/**
		 * 更新公会成员状态及信息通知消息
		 */
		public static const BROADCAST_MEMBER_INFO:Object = {
			module: 7,
			action: 27//
		};
		
		/**
		 * 改变公会状态返回
		 */
		public static const CHANGE_UNION_STATE:Object = {
			module: 7,
			action: 29, request:ChangeUnionStateRequest//
		};
		
		/**
		 * 解散公会返回
		 */
		public static const DISSOLVE_UNION:Object = {
			module: 7,
			action: 31, request:DissolveUnionRequest//
		};
		
		/**
		 * 公会状态及信息通知
		 */
		public static const BROADCAST_UNION_INFO:Object = {
			module: 7,
			action: 32//
		};
		
		/**
		 * 公会捐献返回
		 */
		public static const DONATE_UNION_PARA:Object = {
			module: 7,
			action: 34, request:DonateUnionParaRequest//
		};
		
		/**
		 * 升级公会基地返回
		 */
		public static const UPGRADE_BASE_INFO:Object = {
			module: 7,
			action: 36, request:UpgradeBaseInfoRequest//
		};
		
		/**
		 * 公会抽奖数据返回
		 */
		public static const UNION_LOTTERY_CONTENT:Object = {
			module: 7,
			action: 38, request:UnionLotteryContentRequest//
		};
		
		/**
		 * 公会抽奖返回
		 */
		public static const UNION_LOTTERY:Object = {
			module: 7,
			action: 40, request:UnionLotteryRequest//
		};
		
		/**
		 * 公会商店购买道具返回
		 */
		public static const UNION_BUY_OBJECT:Object = {
			module: 7,
			action: 42, request:UnionBuyObjectRequest//
		};
		
		/**
		 * 公会基地修筑信息
		 */
		public static const UNION_BASE_BUILD_INFO:Object = {
			module: 7,
			action: 44, request:UnionBaseBuildInfoRequest//
		};
		
		/**
		 * 公会广告信息返回
		 */
		public static const UNION_ADV_INFO:Object = {
			module: 7,
			action: 46, request:UnionAdvInfoRequest//
		};
		
		/**
		 * 公会成员伤害输出排行
		 */
		public static const UNION_MEMBER_DPS_RANK_INFO:Object = {
			module: 7,
			action: 48, request:UnionMemberDpsRankInfoRequest//
		};
		
		/**
		 * 公会抽奖停止通知
		 */
		public static const UNION_LOTTERY_STOP:Object = {
			module: 7,
			action: 50, request:UnionLotteryStopRequest//
		};
		
		/**
		 * 公会积分排行
		 */
		public static const UNION_SCORE_RANK:Object = {
			module: 7,
			action: 52, request:UnionScoreRankRequest//
		};
		
		/**
		 * 公会成员积分信息
		 */
		public static const MEMBER_SCORE_INFO:Object = {
			module: 7,
			action: 54, request:MemberScoreInfoRequest//
		};
		
		/**
		 * 邀请入会
		 */
		public static const REQ_USER_JION_UNION:Object = {
			module: 7,
			action: 56, request:ReqUserJionUnionRequest//
		};
		
		/**
		 * 邀请入会通知
		 */
		public static const UNION_REQUEST_NOTIFY:Object = {
			module: 7,
			action: 57//
		};
		
		/**
		 * 邀请入会应答
		 */
		public static const INVITE_UNION_ANSWER:Object = {
			module: 7,
			action: 59, request:InviteUnionAnswerRequest//
		};
		
		/**
		 * 邀请入会结果通知
		 */
		public static const UNION_REQUEST_RESULT:Object = {
			module: 7,
			action: 60//
		};
		
		/**
		 * 请求添加状态返回
		 */
		public static const ADD_STATE:Object = {
			module: 8,
			action: 2, request:AddStateRequest//
		};
		
		/**
		 * 请求指定用户的所有状态返回
		 */
		public static const GET_USER_STATES:Object = {
			module: 8,
			action: 4, request:GetUserStatesRequest//
		};
		
		/**
		 * 请求删除状态返回
		 */
		public static const REMOVE_STATE:Object = {
			module: 8,
			action: 6, request:RemoveStateRequest//
		};
		
		/**
		 * 服务器自动返回更新状态
		 */
		public static const UPDATE_STATE:Object = {
			module: 8,
			action: 8, request:UpdateStateRequest//
		};
		
		/**
		 * 发送给指定用户
		 */
		public static const TO_OTHER_USER:Object = {
			module: 9,
			action: 2, request:ToOtherUserRequest//
		};
		
		/**
		 * 发送社会关系列表
		 */
		public static const SEND_RELATION_LIST:Object = {
			module: 10,
			action: 2, request:SendRelationListRequest//
		};
		
		/**
		 * 关系状态变更通知
		 */
		public static const UPDATE_RELATION_STATE:Object = {
			module: 10,
			action: 4, request:UpdateRelationStateRequest//
		};
		
		/**
		 * 邀请加好友
		 */
		public static const RELATION_INTERACTION:Object = {
			module: 10,
			action: 6, request:RelationInteractionRequest//
		};
		
		/**
		 * 添加黑名单，返回
		 */
		public static const ADD_BAD_RELATION:Object = {
			module: 10,
			action: 8, request:AddBadRelationRequest//
		};
		
		/**
		 * 删除关系，返回
		 */
		public static const REMOVE_RELATION:Object = {
			module: 10,
			action: 10, request:RemoveRelationRequest//
		};
		
		/**
		 * 批量添加用户道具数据
		 */
		public static const ADD_ITEM_LIST:Object = {
			module: 11,
			action: 2, request:AddItemListRequest//
		};
		
		/**
		 * 更新道具数据
		 */
		public static const UPDATE_ITEM:Object = {
			module: 11,
			action: 4, request:UpdateItemRequest//
		};
		
		/**
		 * 删除道具数据
		 */
		public static const REMOVE_ITEM:Object = {
			module: 11,
			action: 6, request:RemoveItemRequest//
		};
		
		/**
		 * 交换（移动）用户物品
		 */
		public static const SWAP_MOVE_ITEM:Object = {
			module: 11,
			action: 8, request:SwapMoveItemRequest//
		};
		
		/**
		 * 拆分物品
		 */
		public static const SPLIT_ITEM:Object = {
			module: 11,
			action: 10, request:SplitItemRequest//
		};
		
		/**
		 * 设置格子中的物品数量
		 */
		public static const REF_COUNT_ITEM:Object = {
			module: 11,
			action: 12//
		};
		
		/**
		 * 使用物品返回
		 */
		public static const USE_ITEM:Object = {
			module: 11,
			action: 14, request:UseItemRequest//
		};
		
		/**
		 * 整理背包
		 */
		public static const PACKUP_ITEM:Object = {
			module: 11,
			action: 16, request:PackupItemRequest//
		};
		
		/**
		 * 镶嵌（分解）物品
		 */
		public static const CHANGE_ITEM:Object = {
			module: 11,
			action: 18, request:ChangeItemRequest//
		};
		
		/**
		 * 保存装备洗练效果
		 */
		public static const SAVE_ENCHANCE_PROPERTY:Object = {
			module: 11,
			action: 20, request:SaveEnchancePropertyRequest//
		};
		
		/**
		 * 装备格子信息
		 */
		public static const EQUIP_GRID_INFO:Object = {
			module: 11,
			action: 22, request:EquipGridInfoRequest//
		};
		
		/**
		 * 装备格子升级
		 */
		public static const EQUIP_GRID_UPGRADE:Object = {
			module: 11,
			action: 24, request:EquipGridUpgradeRequest//
		};
		
		/**
		 * 英雄详细信息
		 */
		public static const HERO_DETAIL_INFO:Object = {
			module: 11,
			action: 26, request:HeroDetailInfoRequest//
		};
		
		/**
		 * 英雄可洗技能
		 */
		public static const ENABLE_REBUILD_SKILLS:Object = {
			module: 11,
			action: 28, request:EnableRebuildSkillsRequest//
		};
		
		/**
		 * 英雄技能配置
		 */
		public static const REBUILD_HERO:Object = {
			module: 11,
			action: 30, request:RebuildHeroRequest//
		};
		
		/**
		 * 英雄进阶
		 */
		public static const UPGRADE_HERO_QUALITY:Object = {
			module: 11,
			action: 32, request:UpgradeHeroQualityRequest//
		};
		
		/**
		 * 英雄升级、进阶加速（修改冷却时间）
		 */
		public static const UPGRADE_HERO_SPEED:Object = {
			module: 11,
			action: 34, request:UpgradeHeroSpeedRequest//
		};
		
		/**
		 * 英雄升级
		 */
		public static const UPGRADE_HERO:Object = {
			module: 11,
			action: 36, request:UpgradeHeroRequest//
		};
		
		/**
		 * 道具购买
		 */
		public static const BUY_ITEM:Object = {
			module: 11,
			action: 38, request:BuyItemRequest//
		};
		
		/**
		 * 道具出售
		 */
		public static const SELL_ITEM:Object = {
			module: 11,
			action: 40, request:SellItemRequest//
		};
		
		/**
		 * 道具赠送
		 */
		public static const SEND_GIFT_ITEM:Object = {
			module: 11,
			action: 42, request:SendGiftItemRequest//
		};
		
		/**
		 * 礼包列表
		 */
		public static const GIFT_PACKS:Object = {
			module: 11,
			action: 44, request:GiftPacksRequest//
		};
		
		/**
		 * 领取礼包内容
		 */
		public static const GET_GIFT_PACK_ITEM:Object = {
			module: 11,
			action: 46, request:GetGiftPackItemRequest//
		};
		
		/**
		 * 删除礼包
		 */
		public static const DELETE_GIFT_PACK:Object = {
			module: 11,
			action: 48, request:DeleteGiftPackRequest//
		};
		
		/**
		 * 查看玩家展示的道具信息
		 */
		public static const VIEW_ITEM_DETAIL_INFO:Object = {
			module: 11,
			action: 50, request:ViewItemDetailInfoRequest//
		};
		
		/**
		 * 查询背包容量
		 */
		public static const MAIN_PACK_SPACE:Object = {
			module: 11,
			action: 52, request:MainPackSpaceRequest//
		};
		
		/**
		 * 解锁背包格子
		 */
		public static const UNLOCK_MAIN_PACK_SPACE:Object = {
			module: 11,
			action: 54, request:UnlockMainPackSpaceRequest//
		};
		
		/**
		 * 设置英雄的状态
		 */
		public static const SET_HERO_STATE:Object = {
			module: 11,
			action: 56, request:SetHeroStateRequest//
		};
		
		/**
		 * 消耗品BUF
		 */
		public static const LEECHDOM_EFFECT:Object = {
			module: 11,
			action: 58, request:LeechdomEffectRequest//
		};
		
		/**
		 * 宝石转换
		 */
		public static const STONE_TRANSFORM:Object = {
			module: 11,
			action: 60, request:StoneTransformRequest//
		};
		
		/**
		 * 声望消费列表
		 */
		public static const REQ_REPUTATION_LIST:Object = {
			module: 11,
			action: 62, request:ReqReputationListRequest//
		};
		
		/**
		 * 购买声望道具
		 */
		public static const REQ_BUY_REPUTATION_ITEM:Object = {
			module: 11,
			action: 64, request:ReqBuyReputationItemRequest//
		};
		
		/**
		 * 熔炼获得的装备通知
		 */
		public static const GET_FUSION_ITEM:Object = {
			module: 11,
			action: 66, request:GetFusionItemRequest//
		};
		
		/**
		 * 随机宝箱掉落
		 */
		public static const GET_RANDOM_BOX:Object = {
			module: 11,
			action: 68, request:GetRandomBoxRequest//
		};
		
		/**
		 * 领取媒体激活码奖励
		 */
		public static const MEDIA_KEY_REWARD:Object = {
			module: 11,
			action: 70, request:MediaKeyRewardRequest//
		};
		
		/**
		 * 分解获得道具
		 */
		public static const DECOMPOSE_ITEMS:Object = {
			module: 11,
			action: 72, request:DecomposeItemsRequest//
		};
		
		/**
		 * 获取已接任务列表
		 */
		public static const GET_QUEST:Object = {
			module: 12,
			action: 2, request:GetQuestRequest//
		};
		
		/**
		 * 获取新任务列表
		 */
		public static const UPDATE_QUEST:Object = {
			module: 12,
			action: 4, request:UpdateQuestRequest//
		};
		
		/**
		 * 接收任务返回
		 */
		public static const ACCEPT_QUEST:Object = {
			module: 12,
			action: 6, request:AcceptQuestRequest//
		};
		
		/**
		 * 放弃任务返回
		 */
		public static const QUIT_QUEST:Object = {
			module: 12,
			action: 8, request:QuitQuestRequest//
		};
		
		/**
		 * 任务目标完成量通知
		 */
		public static const QUEST_FULFILL_NOTIFY:Object = {
			module: 12,
			action: 9//
		};
		
		/**
		 * 结束任务
		 */
		public static const QUEST_FINISH:Object = {
			module: 12,
			action: 11, request:QuestFinishRequest//
		};
		
		/**
		 * 任务奖励通知
		 */
		public static const QUEST_REWARD_NOTIFY:Object = {
			module: 12,
			action: 12//
		};
		
		/**
		 * 通知访问类任务完成情况
		 */
		public static const NOTIFY_QUEST_INFO:Object = {
			module: 12,
			action: 14, request:NotifyQuestInfoRequest//
		};
		
		/**
		 * 查询我的竞技对象
		 */
		public static const REQ_MY_PK_LIST:Object = {
			module: 13,
			action: 2, request:ReqMyPkListRequest//
		};
		
		/**
		 * 查询我的竞技信息
		 */
		public static const REQ_MY_PK_INFO:Object = {
			module: 13,
			action: 4, request:ReqMyPkInfoRequest//
		};
		
		/**
		 * 查询我的竞技日志
		 */
		public static const REQ_MY_PK_LOG:Object = {
			module: 13,
			action: 6, request:ReqMyPkLogRequest//
		};
		
		/**
		 * 竞技场排行
		 */
		public static const USER_PK_RANKING:Object = {
			module: 13,
			action: 8, request:UserPkRankingRequest//
		};
		
		/**
		 * 查询我的奖励信息
		 */
		public static const REQ_MY_PK_REWARD_INFO:Object = {
			module: 13,
			action: 10, request:ReqMyPkRewardInfoRequest//
		};
		
		/**
		 * 领取奖励
		 */
		public static const GET_PK_REWARD:Object = {
			module: 13,
			action: 12, request:GetPkRewardRequest//
		};
		
		/**
		 * 请求PK
		 */
		public static const REQ_START_PK:Object = {
			module: 13,
			action: 14, request:ReqStartPkRequest//
		};
		
		/**
		 * 增加PK次数和清除冷却时间
		 */
		public static const REQ_UPDATE_COUNT_AND_CD:Object = {
			module: 13,
			action: 16, request:ReqUpdateCountAndCdRequest//
		};
		
		/**
		 * 通知离开限时活动
		 */
		public static const NOTIFY_LEAVE_DARE:Object = {
			module: 13,
			action: 18, request:NotifyLeaveDareRequest//
		};
		
		/**
		 * 通知限时活动状态
		 */
		public static const REQ_DARE_STATE:Object = {
			module: 13,
			action: 20, request:ReqDareStateRequest//
		};
		
		/**
		 * 我的活动信息
		 */
		public static const REQ_MY_ACTIVITIS:Object = {
			module: 13,
			action: 22, request:ReqMyActivitisRequest//
		};
		
		/**
		 * 角斗场立即加入匹配
		 */
		public static const DARE_MATCH_GMAE:Object = {
			module: 13,
			action: 24, request:DareMatchGmaeRequest//
		};
		
		/**
		 * 限时活动参与结果
		 */
		public static const ENTER_DARE_RESULT:Object = {
			module: 13,
			action: 26, request:EnterDareResultRequest//
		};
		
		/**
		 * 角斗场倒计时通知
		 */
		public static const NOTIFY_DARE_COUNT_DOWN:Object = {
			module: 13,
			action: 28, request:NotifyDareCountDownRequest//
		};
		
		/**
		 * 系统公告
		 */
		public static const SYSTEM_NOTICE:Object = {
			module: 13,
			action: 30, request:SystemNoticeRequest//
		};
		
		/**
		 * 请求宝藏列表
		 */
		public static const TREASURE_LIST_INFO:Object = {
			module: 14,
			action: 2, request:TreasureListInfoRequest//
		};
		
		/**
		 * 探宝
		 */
		public static const SEARCH_TREASURE_INFO:Object = {
			module: 14,
			action: 4, request:SearchTreasureInfoRequest//
		};
		
		/**
		 * 探宝日志
		 */
		public static const SEARCH_TREASURE_LOG_INFO:Object = {
			module: 14,
			action: 6, request:SearchTreasureLogInfoRequest//
		};
		
		/**
		 * 进入家园返回
		 */
		public static const ENTER_HOME:Object = {
			module: 15,
			action: 2, request:EnterHomeRequest//
		};
		
		/**
		 * 开放的功能列表
		 */
		public static const OPEN_FUNCTION_LIST:Object = {
			module: 15,
			action: 4, request:OpenFunctionListRequest//
		};
		
		/**
		 * 训练栏信息
		 */
		public static const TRAIN_HERO_LIST:Object = {
			module: 15,
			action: 6, request:TrainHeroListRequest//
		};
		
		/**
		 * 训练英雄
		 */
		public static const TRAIN_HERO:Object = {
			module: 15,
			action: 8, request:TrainHeroRequest//
		};
		
		/**
		 * 道具开启训练栏位
		 */
		public static const OPEN_TRAIN_BASE:Object = {
			module: 15,
			action: 10, request:OpenTrainBaseRequest//
		};
		
		/**
		 * 加速训练进度
		 */
		public static const SPEED_UP_TRAIN_HERO:Object = {
			module: 15,
			action: 12, request:SpeedUpTrainHeroRequest//
		};
		
		/**
		 * 考古区域信息
		 */
		public static const SEARCH_ZONE_LIST:Object = {
			module: 15,
			action: 14, request:SearchZoneListRequest//
		};
		
		/**
		 * 设置考古状态
		 */
		public static const SET_SEARCH_STATE:Object = {
			module: 15,
			action: 16, request:SetSearchStateRequest//
		};
		
		/**
		 * 考古发现
		 */
		public static const SEARCH_FOUND:Object = {
			module: 15,
			action: 18, request:SearchFoundRequest//
		};
		
		/**
		 * 育魂珠信息
		 */
		public static const TRAIN_SOUL_LIST:Object = {
			module: 15,
			action: 20, request:TrainSoulListRequest//
		};
		
		/**
		 * 设置育魂珠状态
		 */
		public static const SET_TRAIN_SOUL_STATE:Object = {
			module: 15,
			action: 22, request:SetTrainSoulStateRequest//
		};
		
		/**
		 * 育魂珠产出返回
		 */
		public static const TRAIN_SOUL_PRODUCT:Object = {
			module: 15,
			action: 24, request:TrainSoulProductRequest//
		};
		
		/**
		 * 加速育魂珠进度
		 */
		public static const SPEED_UP_TRAIN_SOUL:Object = {
			module: 15,
			action: 26, request:SpeedUpTrainSoulRequest//
		};
		
		/**
		 * 拾取魂精返回
		 */
		public static const PICK_UP_SOUL:Object = {
			module: 15,
			action: 28, request:PickUpSoulRequest//
		};
		
		/**
		 * 查询琉璃鸟信息（五千万）
		 */
		public static const REQ_BIRD_INFO:Object = {
			module: 15,
			action: 30, request:ReqBirdInfoRequest//
		};
		
		/**
		 * 喂食琉璃鸟
		 */
		public static const FEED_BIRD:Object = {
			module: 15,
			action: 32, request:FeedBirdRequest//
		};
		
		/**
		 * 神像信息
		 */
		public static const GOD_LIKE:Object = {
			module: 15,
			action: 34, request:GodLikeRequest//
		};
		
		/**
		 * 祝福神像
		 */
		public static const BLESS_GOD:Object = {
			module: 15,
			action: 36, request:BlessGodRequest//
		};
		
		/**
		 * 祝福日志
		 */
		public static const REQ_BLESS_LOG:Object = {
			module: 15,
			action: 38, request:ReqBlessLogRequest//
		};
		
		/**
		 * 领取奖励列表
		 */
		public static const REQ_BLESS_REWARD_LIST:Object = {
			module: 15,
			action: 40, request:ReqBlessRewardListRequest//
		};
		
		/**
		 * 领取祝福奖励
		 */
		public static const REQ_BLESS_REWARD:Object = {
			module: 15,
			action: 42, request:ReqBlessRewardRequest//
		};
		
		/**
		 * 偷取魂晶
		 */
		public static const REQ_STEAL_SOUL:Object = {
			module: 15,
			action: 44, request:ReqStealSoulRequest//
		};
		
		/**
		 * 查询偷取过的好友列表
		 */
		public static const REQ_STEAL_SOUL_LIST:Object = {
			module: 15,
			action: 46, request:ReqStealSoulListRequest//
		};
		
		/**
		 * 竞赛问答题内容
		 */
		public static const QUESTION_QUIZ:Object = {
			module: 17,
			action: 2, request:QuestionQuizRequest//
		};
		
		/**
		 * 回答问题
		 */
		public static const ANSWER_QUIZ:Object = {
			module: 17,
			action: 4, request:AnswerQuizRequest//
		};
		
		/**
		 * 竞赛结果
		 */
		public static const QUIZ_POS_LIST:Object = {
			module: 17,
			action: 6, request:QuizPosListRequest//
		};
		
		/**
		 * 发邮件
		 */
		public static const REQ_SEND_MAIL:Object = {
			module: 18,
			action: 2, request:ReqSendMailRequest//
		};
		
		/**
		 * 获取邮件列表
		 */
		public static const REQ_GET_LIST_MAIL:Object = {
			module: 18,
			action: 4, request:ReqGetListMailRequest//
		};
		
		/**
		 * 返回邮件内容
		 */
		public static const REQ_OPEN_MAIL:Object = {
			module: 18,
			action: 6, request:ReqOpenMailRequest//
		};
		
		/**
		 * 获取邮件附件返回
		 */
		public static const REQ_GET_ITEM_MAIL:Object = {
			module: 18,
			action: 8, request:ReqGetItemMailRequest//
		};
		
		/**
		 * 删除邮件
		 */
		public static const REQ_DEL_MAIL:Object = {
			module: 18,
			action: 10, request:ReqDelMailRequest//
		};
		
		/**
		 * 新邮件提示
		 */
		public static const NOTIFY_NEW_MAIL:Object = {
			module: 18,
			action: 12, request:NotifyNewMailRequest//
		};
		
		public function Protocol()
		{
		
		}
		
		/**
		 * 查找协议 
		 */        
		public function lookup(module:uint, action:uint):IResponse {
		    var c:Class = _protoMap[_toString(module, action)];
		    if (! c) {
		        return null;
		    }
			return new c;
		}
		
		/**
		 * 注册协议 
		 */    
		public function register():void {
			_protoMap[_key(LOGIN)] = LoginResponse;
			_protoMap[_key(LOGIN_GATE)] = LoginGateResponse;
			_protoMap[_key(VISITOR_LOGIN)] = VisitorLoginResponse;
			_protoMap[_key(RELOGIN)] = ReloginResponse;
			_protoMap[_key(RELOAD_CONFIG)] = ReloadConfigResponse;
			_protoMap[_key(KICK_USER_OUT_NOTIFY)] = KickUserOutNotifyResponse;
			_protoMap[_key(USER_ROLE_LIST)] = UserRoleListResponse;
			_protoMap[_key(CREATE_ROLE)] = CreateRoleResponse;
			_protoMap[_key(LOGIN_ROLE)] = LoginRoleResponse;
			_protoMap[_key(REMOVE_ROLE)] = RemoveRoleResponse;
			_protoMap[_key(REQ_USER_INFO)] = ReqUserInfoResponse;
			_protoMap[_key(USER_SKILL_LIST)] = UserSkillListResponse;
			_protoMap[_key(ADD_USER_SKILL)] = AddUserSkillResponse;
			_protoMap[_key(CONFIG_USER_SKILL)] = ConfigUserSkillResponse;
			_protoMap[_key(UPGRADE_USER_SKILL)] = UpgradeUserSkillResponse;
			_protoMap[_key(OFFLINE_MSG)] = OfflineMsgResponse;
			_protoMap[_key(UPDATE_MONEY_NOTIFY)] = UpdateMoneyNotifyResponse;
			_protoMap[_key(ENABLE_INSTANCE_MAP)] = EnableInstanceMapResponse;
			_protoMap[_key(USER_OBTAIN_EXP)] = UserObtainExpResponse;
			_protoMap[_key(OBTAIN_PET_INFO_PARA)] = ObtainPetInfoParaResponse;
			_protoMap[_key(REQ_OTHER_USER_INFO)] = ReqOtherUserInfoResponse;
			_protoMap[_key(INVITE_GAME_RESULT)] = InviteGameResultResponse;
			_protoMap[_key(DAILY_TASK_LIST)] = DailyTaskListResponse;
			_protoMap[_key(UPDATE_DAILY_TASK)] = UpdateDailyTaskResponse;
			_protoMap[_key(DAILY_TASK_REWARD_LIST)] = DailyTaskRewardListResponse;
			_protoMap[_key(REQ_DAILY_TASK_REWARD)] = ReqDailyTaskRewardResponse;
			_protoMap[_key(UPGRADE_OBTAIN_PET)] = UpgradeObtainPetResponse;
			_protoMap[_key(REQ_FORBID_INSTANCE_TIME)] = ReqForbidInstanceTimeResponse;
			_protoMap[_key(GODMODE_PLAY_LIST)] = GodmodePlayListResponse;
			_protoMap[_key(REFRESH_GODMODE)] = RefreshGodmodeResponse;
			_protoMap[_key(RECHAREGE_MONEY_PARA)] = RecharegeMoneyParaResponse;
			_protoMap[_key(USER_VIP_INFO)] = UserVipInfoResponse;
			_protoMap[_key(NEW_GUIDE_NOTIFY)] = NewGuideNotifyResponse;
			_protoMap[_key(NEW_GUIDE_DONE)] = NewGuideDoneResponse;
			_protoMap[_key(SAVE_CUSTOM_DATA)] = SaveCustomDataResponse;
			_protoMap[_key(REQ_CUSTOM_DATA)] = ReqCustomDataResponse;
			_protoMap[_key(REQ_SYSTEM_SETTINGS)] = ReqSystemSettingsResponse;
			_protoMap[_key(SET_SYSTEM_SETTINGS)] = SetSystemSettingsResponse;
			_protoMap[_key(USER_COLLECT_REWARD)] = UserCollectRewardResponse;
			_protoMap[_key(KEEP_GAME_REWARD)] = KeepGameRewardResponse;
			_protoMap[_key(GOD_SEAL_INFO)] = GodSealInfoResponse;
			_protoMap[_key(RELEASE_GOD_SEAL)] = ReleaseGodSealResponse;
			_protoMap[_key(GOD_CTRL_INFO)] = GodCtrlInfoResponse;
			_protoMap[_key(RAISE_GOD_CTRL_INFO)] = RaiseGodCtrlInfoResponse;
			_protoMap[_key(RESET_GOD_CTRL_INFO)] = ResetGodCtrlInfoResponse;
			_protoMap[_key(USER_COLLECT_REWARD_INFO)] = UserCollectRewardInfoResponse;
			_protoMap[_key(DEPLOY_FIGHT_OBJECT)] = DeployFightObjectResponse;
			_protoMap[_key(REQ_REWARD_INSTANCE_LIST)] = ReqRewardInstanceListResponse;
			_protoMap[_key(REFRESH_REWARD_INSTANCE)] = RefreshRewardInstanceResponse;
			_protoMap[_key(FIGHT_OBJECT_INFO)] = FightObjectInfoResponse;
			_protoMap[_key(DRAMA_LIST)] = DramaListResponse;
			_protoMap[_key(ADD_DRAMA)] = AddDramaResponse;
			_protoMap[_key(SAVE_UI_OPEN)] = SaveUiOpenResponse;
			_protoMap[_key(UI_OPEN_LIST)] = UiOpenListResponse;
			_protoMap[_key(MY_MOP_UP_INFO)] = MyMopUpInfoResponse;
			_protoMap[_key(START_MOP_UP)] = StartMopUpResponse;
			_protoMap[_key(MOP_UP_RESULT)] = MopUpResultResponse;
			_protoMap[_key(GET_VIP_GIFTPACK)] = GetVipGiftpackResponse;
			_protoMap[_key(CANCEL_ADDICT)] = CancelAddictResponse;
			_protoMap[_key(ACTIVITY_RANK_REWARD)] = ActivityRankRewardResponse;
			_protoMap[_key(USER_FIGHTBOSS_INFO)] = UserFightbossInfoResponse;
			_protoMap[_key(USER_FIGHTBOSS_REWARD)] = UserFightbossRewardResponse;
			_protoMap[_key(REQ_EVENT_INSTANCE_LIST)] = ReqEventInstanceListResponse;
			_protoMap[_key(REQ_CAPITAL_ACTIVE_STATE)] = ReqCapitalActiveStateResponse;
			_protoMap[_key(RECHARGE_FEEDBACK_STATE)] = RechargeFeedbackStateResponse;
			_protoMap[_key(REQ_FEEDBACK_GIFTPACK_INFO)] = ReqFeedbackGiftpackInfoResponse;
			_protoMap[_key(FIRST_RECHARGE_STATE_INFO)] = FirstRechargeStateInfoResponse;
			_protoMap[_key(FIRST_RECHARGE_REWARD_INFO)] = FirstRechargeRewardInfoResponse;
			_protoMap[_key(USER_CONSUME_INFO)] = UserConsumeInfoResponse;
			_protoMap[_key(CONSUME_LOTTERY_INFO)] = ConsumeLotteryInfoResponse;
			_protoMap[_key(ACTIVE_LOGIN_INFO)] = ActiveLoginInfoResponse;
			_protoMap[_key(GIFT_PACK_REWARD_LIST)] = GiftPackRewardListResponse;
			_protoMap[_key(GET_GIFT_PACK_REWARD)] = GetGiftPackRewardResponse;
			_protoMap[_key(HOLD_ONLINE)] = HoldOnlineResponse;
			_protoMap[_key(HOLD_ONLINE_TIMER)] = HoldOnlineTimerResponse;
			_protoMap[_key(CANCEL_HOLD_ONLINE)] = CancelHoldOnlineResponse;
			_protoMap[_key(MY_NPC_RACE_INFO)] = MyNpcRaceInfoResponse;
			_protoMap[_key(NPC_RACE_LIST)] = NpcRaceListResponse;
			_protoMap[_key(NPC_RACE_BET)] = NpcRaceBetResponse;
			_protoMap[_key(NPC_RACE_STATE)] = NpcRaceStateResponse;
			_protoMap[_key(TIME)] = TimeResponse;
			_protoMap[_key(REQ_CLIENT_TIME)] = ReqClientTimeResponse;
			_protoMap[_key(CREATE_ROOM)] = CreateRoomResponse;
			_protoMap[_key(HALLROOM_LIST)] = HallroomListResponse;
			_protoMap[_key(ROOM_INFO)] = RoomInfoResponse;
			_protoMap[_key(ENTER_ROOM)] = EnterRoomResponse;
			_protoMap[_key(LEAVE_ROOM)] = LeaveRoomResponse;
			_protoMap[_key(KICK_USER_OUTROOM)] = KickUserOutroomResponse;
			_protoMap[_key(UPDATE_ROLE)] = UpdateRoleResponse;
			_protoMap[_key(HALL_USER_STATE)] = HallUserStateResponse;
			_protoMap[_key(CHANGE_GAME_INSTANCE)] = ChangeGameInstanceResponse;
			_protoMap[_key(INVITE_RELATION_INTO_GAME)] = InviteRelationIntoGameResponse;
			_protoMap[_key(INVITE_INTO_GAME_INFO_NOTIFY)] = InviteIntoGameInfoNotifyResponse;
			_protoMap[_key(START_GAME)] = StartGameResponse;
			_protoMap[_key(QUICK_JOIN_GAME)] = QuickJoinGameResponse;
			_protoMap[_key(USER_LEVEL_RANKING)] = UserLevelRankingResponse;
			_protoMap[_key(USER_WEALTH_RANKING)] = UserWealthRankingResponse;
			_protoMap[_key(USER_COMBAT_RANKING)] = UserCombatRankingResponse;
			_protoMap[_key(UNION_LEVEL_RANKING)] = UnionLevelRankingResponse;
			_protoMap[_key(AUTO_ENTER_GAME)] = AutoEnterGameResponse;
			_protoMap[_key(REQ_MY_RANKING)] = ReqMyRankingResponse;
			_protoMap[_key(SET_ROOM_STATE)] = SetRoomStateResponse;
			_protoMap[_key(UPDATE_ROOM_STATE)] = UpdateRoomStateResponse;
			_protoMap[_key(MATCH_GAME)] = MatchGameResponse;
			_protoMap[_key(CREATE_TEAM_INFO)] = CreateTeamInfoResponse;
			_protoMap[_key(TEAM_DETAIL_INFO)] = TeamDetailInfoResponse;
			_protoMap[_key(TEAM_LIST_INFO)] = TeamListInfoResponse;
			_protoMap[_key(KICK_TEAM_USER_INFO)] = KickTeamUserInfoResponse;
			_protoMap[_key(ENTER_TEAM)] = EnterTeamResponse;
			_protoMap[_key(LEAVE_TEAM)] = LeaveTeamResponse;
			_protoMap[_key(TEAM_READY_GAME)] = TeamReadyGameResponse;
			_protoMap[_key(ENTER_COPY_MAP)] = EnterCopyMapResponse;
			_protoMap[_key(ENTER_STATION_MAP)] = EnterStationMapResponse;
			_protoMap[_key(LEAVE_MAP)] = LeaveMapResponse;
			_protoMap[_key(BATCH_ADD_USER)] = BatchAddUserResponse;
			_protoMap[_key(MOVE)] = MoveResponse;
			_protoMap[_key(DELETE_MAP_DATA)] = DeleteMapDataResponse;
			_protoMap[_key(ADD_USER)] = AddUserResponse;
			_protoMap[_key(BATCH_REMOVE_MAP_DATA)] = BatchRemoveMapDataResponse;
			_protoMap[_key(CHANGE_MAP)] = ChangeMapResponse;
			_protoMap[_key(USER_OBJECT_INFO)] = UserObjectInfoResponse;
			_protoMap[_key(PET_INFO)] = PetInfoResponse;
			_protoMap[_key(SCENE_PET_INFO)] = ScenePetInfoResponse;
			_protoMap[_key(SCENE_USER_INFO)] = SceneUserInfoResponse;
			_protoMap[_key(GOLD_MINE)] = GoldMineResponse;
			_protoMap[_key(DOOR_STATE)] = DoorStateResponse;
			_protoMap[_key(ENDOF_INIT)] = EndofInitResponse;
			_protoMap[_key(SELECT_ATTACK_NPC)] = SelectAttackNpcResponse;
			_protoMap[_key(UPGRADE_NPC)] = UpgradeNpcResponse;
			_protoMap[_key(ATTACK_START)] = AttackStartResponse;
			_protoMap[_key(MAGIC_SWITCH)] = MagicSwitchResponse;
			_protoMap[_key(MAGIC_ATTACK_START_RESULT)] = MagicAttackStartResultResponse;
			_protoMap[_key(MAGIC_ATTACK)] = MagicAttackResponse;
			_protoMap[_key(MAGIC_ATTACK_RESULT)] = MagicAttackResultResponse;
			_protoMap[_key(SET_STATE)] = SetStateResponse;
			_protoMap[_key(CLEAR_STATE)] = ClearStateResponse;
			_protoMap[_key(SET_HP)] = SetHpResponse;
			_protoMap[_key(DEATH_NOTIFY)] = DeathNotifyResponse;
			_protoMap[_key(RELIVE_MAP_DATA)] = ReliveMapDataResponse;
			_protoMap[_key(NPC_LEAVE_NOTIFY)] = NpcLeaveNotifyResponse;
			_protoMap[_key(GAME_RESULT_NOTIFY)] = GameResultNotifyResponse;
			_protoMap[_key(RESOURCE_PET_INFO)] = ResourcePetInfoResponse;
			_protoMap[_key(RESOURCE_PET_PRODUCT)] = ResourcePetProductResponse;
			_protoMap[_key(GET_PET_RESOURCE)] = GetPetResourceResponse;
			_protoMap[_key(BACK_OFF_STATE)] = BackOffStateResponse;
			_protoMap[_key(SET_SCENE_EFFECT)] = SetSceneEffectResponse;
			_protoMap[_key(SET_TARGET_PET)] = SetTargetPetResponse;
			_protoMap[_key(CHANGE_DOOR_STATE)] = ChangeDoorStateResponse;
			_protoMap[_key(TOGGLE_DOOR)] = ToggleDoorResponse;
			_protoMap[_key(TOGGLE_DOOR_NOTIFY_OTHER)] = ToggleDoorNotifyOtherResponse;
			_protoMap[_key(ADD_MAP_ITEM)] = AddMapItemResponse;
			_protoMap[_key(PICK_UP_ITEM)] = PickUpItemResponse;
			_protoMap[_key(RIGHT_NOW_GAME_OVER)] = RightNowGameOverResponse;
			_protoMap[_key(GOTO)] = GotoResponse;
			_protoMap[_key(SCENE_DPS_LIST)] = SceneDpsListResponse;
			_protoMap[_key(PLAY_BACKGROUND_MUSIC)] = PlayBackgroundMusicResponse;
			_protoMap[_key(LOADING_PROGRESS_NOTIFY)] = LoadingProgressNotifyResponse;
			_protoMap[_key(CHANNEL_CHAT)] = ChannelChatResponse;
			_protoMap[_key(SYS_NOTIFY)] = SysNotifyResponse;
			_protoMap[_key(UNION_LIST_INFO)] = UnionListInfoResponse;
			_protoMap[_key(UNION_DETAIL_INFO)] = UnionDetailInfoResponse;
			_protoMap[_key(UNION_MEMBER_INFO)] = UnionMemberInfoResponse;
			_protoMap[_key(APPLY_INFO)] = ApplyInfoResponse;
			_protoMap[_key(CREATE_UNION)] = CreateUnionResponse;
			_protoMap[_key(APPLY_JOIN)] = ApplyJoinResponse;
			_protoMap[_key(APPLY_QUIT)] = ApplyQuitResponse;
			_protoMap[_key(APPLY_LIST)] = ApplyListResponse;
			_protoMap[_key(ALLOW_APPLY)] = AllowApplyResponse;
			_protoMap[_key(CHANGE_POWER)] = ChangePowerResponse;
			_protoMap[_key(CHANGE_NOTICE)] = ChangeNoticeResponse;
			_protoMap[_key(CHANGE_LEADER)] = ChangeLeaderResponse;
			_protoMap[_key(REMOVE_MEMBER)] = RemoveMemberResponse;
			_protoMap[_key(BROADCAST_MEMBER_INFO)] = BroadcastMemberInfoResponse;
			_protoMap[_key(CHANGE_UNION_STATE)] = ChangeUnionStateResponse;
			_protoMap[_key(DISSOLVE_UNION)] = DissolveUnionResponse;
			_protoMap[_key(BROADCAST_UNION_INFO)] = BroadcastUnionInfoResponse;
			_protoMap[_key(DONATE_UNION_PARA)] = DonateUnionParaResponse;
			_protoMap[_key(UPGRADE_BASE_INFO)] = UpgradeBaseInfoResponse;
			_protoMap[_key(UNION_LOTTERY_CONTENT)] = UnionLotteryContentResponse;
			_protoMap[_key(UNION_LOTTERY)] = UnionLotteryResponse;
			_protoMap[_key(UNION_BUY_OBJECT)] = UnionBuyObjectResponse;
			_protoMap[_key(UNION_BASE_BUILD_INFO)] = UnionBaseBuildInfoResponse;
			_protoMap[_key(UNION_ADV_INFO)] = UnionAdvInfoResponse;
			_protoMap[_key(UNION_MEMBER_DPS_RANK_INFO)] = UnionMemberDpsRankInfoResponse;
			_protoMap[_key(UNION_LOTTERY_STOP)] = UnionLotteryStopResponse;
			_protoMap[_key(UNION_SCORE_RANK)] = UnionScoreRankResponse;
			_protoMap[_key(MEMBER_SCORE_INFO)] = MemberScoreInfoResponse;
			_protoMap[_key(REQ_USER_JION_UNION)] = ReqUserJionUnionResponse;
			_protoMap[_key(UNION_REQUEST_NOTIFY)] = UnionRequestNotifyResponse;
			_protoMap[_key(INVITE_UNION_ANSWER)] = InviteUnionAnswerResponse;
			_protoMap[_key(UNION_REQUEST_RESULT)] = UnionRequestResultResponse;
			_protoMap[_key(ADD_STATE)] = AddStateResponse;
			_protoMap[_key(GET_USER_STATES)] = GetUserStatesResponse;
			_protoMap[_key(REMOVE_STATE)] = RemoveStateResponse;
			_protoMap[_key(UPDATE_STATE)] = UpdateStateResponse;
			_protoMap[_key(TO_OTHER_USER)] = ToOtherUserResponse;
			_protoMap[_key(SEND_RELATION_LIST)] = SendRelationListResponse;
			_protoMap[_key(UPDATE_RELATION_STATE)] = UpdateRelationStateResponse;
			_protoMap[_key(RELATION_INTERACTION)] = RelationInteractionResponse;
			_protoMap[_key(ADD_BAD_RELATION)] = AddBadRelationResponse;
			_protoMap[_key(REMOVE_RELATION)] = RemoveRelationResponse;
			_protoMap[_key(ADD_ITEM_LIST)] = AddItemListResponse;
			_protoMap[_key(UPDATE_ITEM)] = UpdateItemResponse;
			_protoMap[_key(REMOVE_ITEM)] = RemoveItemResponse;
			_protoMap[_key(SWAP_MOVE_ITEM)] = SwapMoveItemResponse;
			_protoMap[_key(SPLIT_ITEM)] = SplitItemResponse;
			_protoMap[_key(REF_COUNT_ITEM)] = RefCountItemResponse;
			_protoMap[_key(USE_ITEM)] = UseItemResponse;
			_protoMap[_key(PACKUP_ITEM)] = PackupItemResponse;
			_protoMap[_key(CHANGE_ITEM)] = ChangeItemResponse;
			_protoMap[_key(SAVE_ENCHANCE_PROPERTY)] = SaveEnchancePropertyResponse;
			_protoMap[_key(EQUIP_GRID_INFO)] = EquipGridInfoResponse;
			_protoMap[_key(EQUIP_GRID_UPGRADE)] = EquipGridUpgradeResponse;
			_protoMap[_key(HERO_DETAIL_INFO)] = HeroDetailInfoResponse;
			_protoMap[_key(ENABLE_REBUILD_SKILLS)] = EnableRebuildSkillsResponse;
			_protoMap[_key(REBUILD_HERO)] = RebuildHeroResponse;
			_protoMap[_key(UPGRADE_HERO_QUALITY)] = UpgradeHeroQualityResponse;
			_protoMap[_key(UPGRADE_HERO_SPEED)] = UpgradeHeroSpeedResponse;
			_protoMap[_key(UPGRADE_HERO)] = UpgradeHeroResponse;
			_protoMap[_key(BUY_ITEM)] = BuyItemResponse;
			_protoMap[_key(SELL_ITEM)] = SellItemResponse;
			_protoMap[_key(SEND_GIFT_ITEM)] = SendGiftItemResponse;
			_protoMap[_key(GIFT_PACKS)] = GiftPacksResponse;
			_protoMap[_key(GET_GIFT_PACK_ITEM)] = GetGiftPackItemResponse;
			_protoMap[_key(DELETE_GIFT_PACK)] = DeleteGiftPackResponse;
			_protoMap[_key(VIEW_ITEM_DETAIL_INFO)] = ViewItemDetailInfoResponse;
			_protoMap[_key(MAIN_PACK_SPACE)] = MainPackSpaceResponse;
			_protoMap[_key(UNLOCK_MAIN_PACK_SPACE)] = UnlockMainPackSpaceResponse;
			_protoMap[_key(SET_HERO_STATE)] = SetHeroStateResponse;
			_protoMap[_key(LEECHDOM_EFFECT)] = LeechdomEffectResponse;
			_protoMap[_key(STONE_TRANSFORM)] = StoneTransformResponse;
			_protoMap[_key(REQ_REPUTATION_LIST)] = ReqReputationListResponse;
			_protoMap[_key(REQ_BUY_REPUTATION_ITEM)] = ReqBuyReputationItemResponse;
			_protoMap[_key(GET_FUSION_ITEM)] = GetFusionItemResponse;
			_protoMap[_key(GET_RANDOM_BOX)] = GetRandomBoxResponse;
			_protoMap[_key(MEDIA_KEY_REWARD)] = MediaKeyRewardResponse;
			_protoMap[_key(DECOMPOSE_ITEMS)] = DecomposeItemsResponse;
			_protoMap[_key(GET_QUEST)] = GetQuestResponse;
			_protoMap[_key(UPDATE_QUEST)] = UpdateQuestResponse;
			_protoMap[_key(ACCEPT_QUEST)] = AcceptQuestResponse;
			_protoMap[_key(QUIT_QUEST)] = QuitQuestResponse;
			_protoMap[_key(QUEST_FULFILL_NOTIFY)] = QuestFulfillNotifyResponse;
			_protoMap[_key(QUEST_FINISH)] = QuestFinishResponse;
			_protoMap[_key(QUEST_REWARD_NOTIFY)] = QuestRewardNotifyResponse;
			_protoMap[_key(NOTIFY_QUEST_INFO)] = NotifyQuestInfoResponse;
			_protoMap[_key(REQ_MY_PK_LIST)] = ReqMyPkListResponse;
			_protoMap[_key(REQ_MY_PK_INFO)] = ReqMyPkInfoResponse;
			_protoMap[_key(REQ_MY_PK_LOG)] = ReqMyPkLogResponse;
			_protoMap[_key(USER_PK_RANKING)] = UserPkRankingResponse;
			_protoMap[_key(REQ_MY_PK_REWARD_INFO)] = ReqMyPkRewardInfoResponse;
			_protoMap[_key(GET_PK_REWARD)] = GetPkRewardResponse;
			_protoMap[_key(REQ_START_PK)] = ReqStartPkResponse;
			_protoMap[_key(REQ_UPDATE_COUNT_AND_CD)] = ReqUpdateCountAndCdResponse;
			_protoMap[_key(NOTIFY_LEAVE_DARE)] = NotifyLeaveDareResponse;
			_protoMap[_key(REQ_DARE_STATE)] = ReqDareStateResponse;
			_protoMap[_key(REQ_MY_ACTIVITIS)] = ReqMyActivitisResponse;
			_protoMap[_key(DARE_MATCH_GMAE)] = DareMatchGmaeResponse;
			_protoMap[_key(ENTER_DARE_RESULT)] = EnterDareResultResponse;
			_protoMap[_key(NOTIFY_DARE_COUNT_DOWN)] = NotifyDareCountDownResponse;
			_protoMap[_key(SYSTEM_NOTICE)] = SystemNoticeResponse;
			_protoMap[_key(TREASURE_LIST_INFO)] = TreasureListInfoResponse;
			_protoMap[_key(SEARCH_TREASURE_INFO)] = SearchTreasureInfoResponse;
			_protoMap[_key(SEARCH_TREASURE_LOG_INFO)] = SearchTreasureLogInfoResponse;
			_protoMap[_key(ENTER_HOME)] = EnterHomeResponse;
			_protoMap[_key(OPEN_FUNCTION_LIST)] = OpenFunctionListResponse;
			_protoMap[_key(TRAIN_HERO_LIST)] = TrainHeroListResponse;
			_protoMap[_key(TRAIN_HERO)] = TrainHeroResponse;
			_protoMap[_key(OPEN_TRAIN_BASE)] = OpenTrainBaseResponse;
			_protoMap[_key(SPEED_UP_TRAIN_HERO)] = SpeedUpTrainHeroResponse;
			_protoMap[_key(SEARCH_ZONE_LIST)] = SearchZoneListResponse;
			_protoMap[_key(SET_SEARCH_STATE)] = SetSearchStateResponse;
			_protoMap[_key(SEARCH_FOUND)] = SearchFoundResponse;
			_protoMap[_key(TRAIN_SOUL_LIST)] = TrainSoulListResponse;
			_protoMap[_key(SET_TRAIN_SOUL_STATE)] = SetTrainSoulStateResponse;
			_protoMap[_key(TRAIN_SOUL_PRODUCT)] = TrainSoulProductResponse;
			_protoMap[_key(SPEED_UP_TRAIN_SOUL)] = SpeedUpTrainSoulResponse;
			_protoMap[_key(PICK_UP_SOUL)] = PickUpSoulResponse;
			_protoMap[_key(REQ_BIRD_INFO)] = ReqBirdInfoResponse;
			_protoMap[_key(FEED_BIRD)] = FeedBirdResponse;
			_protoMap[_key(GOD_LIKE)] = GodLikeResponse;
			_protoMap[_key(BLESS_GOD)] = BlessGodResponse;
			_protoMap[_key(REQ_BLESS_LOG)] = ReqBlessLogResponse;
			_protoMap[_key(REQ_BLESS_REWARD_LIST)] = ReqBlessRewardListResponse;
			_protoMap[_key(REQ_BLESS_REWARD)] = ReqBlessRewardResponse;
			_protoMap[_key(REQ_STEAL_SOUL)] = ReqStealSoulResponse;
			_protoMap[_key(REQ_STEAL_SOUL_LIST)] = ReqStealSoulListResponse;
			_protoMap[_key(QUESTION_QUIZ)] = QuestionQuizResponse;
			_protoMap[_key(ANSWER_QUIZ)] = AnswerQuizResponse;
			_protoMap[_key(QUIZ_POS_LIST)] = QuizPosListResponse;
			_protoMap[_key(REQ_SEND_MAIL)] = ReqSendMailResponse;
			_protoMap[_key(REQ_GET_LIST_MAIL)] = ReqGetListMailResponse;
			_protoMap[_key(REQ_OPEN_MAIL)] = ReqOpenMailResponse;
			_protoMap[_key(REQ_GET_ITEM_MAIL)] = ReqGetItemMailResponse;
			_protoMap[_key(REQ_DEL_MAIL)] = ReqDelMailResponse;
			_protoMap[_key(NOTIFY_NEW_MAIL)] = NotifyNewMailResponse;
			}
		
		private static function _key(o:Object):String {
			return _toString(o.module, o.action);
		}
		
		private static function _toString(module:uint, action:uint):String {
			return module + ':' + action;
		}
	}
}