class BasementInspection{


  String Id;
  String CompanyId;
  String CustomerId;
  String CurrentOutsideConditions;
  String OutsideRelativeHumidity;
  String OutsideTemperature;
  String FirstFloorRelativeHumidity;
  String FirstFloorTemperature;
  String RelativeOther1;
  String RelativeOther2;
  String Heat;
  String Air;
  String BasementRelativeHumidity;
  String BasementTemperature;
  String BasementDehumidifier;
  String GroundWater;
  String GroundWaterRating;
  String IronBacteria;
  String IronBacteriaRating;
  String Condensation;
  String CondensationRating;
  String WallCracks;
  String WallCracksRating;
  String FloorCracks;
  String FloorCracksRating;
  String ExistingSumpPump;
  String ExistingDrainageSystem;
  String ExistingRadonSystem;
  String DryerVentToCode;
  String FoundationType;
  String Bulkhead;
  String VisualBasementOther;
  String NoticedSmellsOrOdors;
  String NoticedSmellsOrOdorsComment;
  String NoticedMoldOrMildew;
  String NoticedMoldOrMildewComment;
  String BasementGoDown;
  String HomeSufferForRespiratory;
  String HomeSufferForrespiratoryComment;
  String ChildrenPlayInBasement;
  String ChildrenPlayInBasementComment;
  String PetsGoInBasement;
  String PetsGoInBasementComment;
  String NoticedBugsOrRodents;
  String NoticedBugsOrRodentsComment;
  String GetWater;
  String GetWaterComment;
  String RemoveWater;
  String SeeCondensationPipesDripping;
  String SeeCondensationPipesDrippingComment;
  String RepairsProblems;
  String RepairsProblemsComment;
  String LivingPlan;
  String SellPlaning;
  String PlansForBasementOnce;
  String HomeTestForPastRadon;
  String HomeTestForPastRadonComment;
  String LosePower;
  String LosePowerHowOften;
  String CustomerBasementOther;
  String Drawing;
  String Notes;
  String PMSignature;
  String PMSignatureDate;
  String HomeOwnerSignature;
  String HomeOwnerSignatureDate;
  String CreatedBy;
  String CreatedDate;
  String LastUpdatedBy;
  String LastUpdatedDate;
  String InspectionPhoto;
  String RowState;

  BasementInspection(
      this.Id,
      this.CompanyId,
      this.OutsideRelativeHumidity,
      this.FirstFloorTemperature,
      this.RelativeOther1,
      this.RelativeOther2,
      this.BasementRelativeHumidity,
      this.BasementTemperature,
      this.GroundWaterRating,
      this.IronBacteria,
      this.WallCracks,
      this.ExistingDrainageSystem,
      this.FoundationType,
      this.Bulkhead,
      this.VisualBasementOther,
      this.NoticedSmellsOrOdors,
      this.NoticedSmellsOrOdorsComment,
      this.NoticedMoldOrMildewComment,
      this.BasementGoDown,
      this.HomeSufferForrespiratoryComment,
      this.ChildrenPlayInBasement,
      this.ChildrenPlayInBasementComment,
      this.NoticedBugsOrRodentsComment,
      this.GetWaterComment,
      this.SeeCondensationPipesDrippingComment,
      this.LivingPlan,
      this.SellPlaning,
      this.PlansForBasementOnce,
      this.HomeTestForPastRadonComment,
      this.LosePowerHowOften,
      this.Drawing,
      this.Notes,
      this.PMSignature,
      this.HomeOwnerSignature,
      this.CreatedBy,
      this.InspectionPhoto);

  BasementInspection.fromMap(Map<String ,dynamic> map){
    Id=map['Id'].toString();
    CompanyId=map['CompanyId'];
    OutsideRelativeHumidity=map['OutsideRelativeHumidity'];
    FirstFloorTemperature=map['FirstFloorTemperature'];
    RelativeOther1=map['RelativeOther1'];
    RelativeOther2=map['RelativeOther2'];
    BasementRelativeHumidity=map['BasementRelativeHumidity'];
    BasementTemperature=map['BasementTemperature'];
    GroundWaterRating=map['GroundWaterRating'];
    IronBacteria=map['IronBacteria'];
    WallCracks=map['WallCracks'];
    ExistingDrainageSystem=map['ExistingDrainageSystem'];
    FoundationType=map['FoundationType'];
    Bulkhead=map['Bulkhead'];
    VisualBasementOther=map['VisualBasementOther'];
    NoticedSmellsOrOdors=map['NoticedSmellsOrOdors'];
    NoticedSmellsOrOdorsComment=map['NoticedSmellsOrOdorsComment'];
    NoticedMoldOrMildewComment=map['NoticedMoldOrMildewComment'];
    BasementGoDown=map['BasementGoDown'];
    HomeSufferForrespiratoryComment=map['HomeSufferForrespiratoryComment'];
    ChildrenPlayInBasement=map['ChildrenPlayInBasement'];
    ChildrenPlayInBasementComment=map['ChildrenPlayInBasementComment'];
    NoticedBugsOrRodentsComment=map['NoticedBugsOrRodentsComment'];
    GetWaterComment=map['GetWaterComment'];
    SeeCondensationPipesDrippingComment=map['SeeCondensationPipesDrippingComment'];
    LivingPlan=map['LivingPlan'];
    SellPlaning=map['SellPlaning'];
    PlansForBasementOnce=map['PlansForBasementOnce'];
    HomeTestForPastRadonComment=map['HomeTestForPastRadonComment'];
    LosePowerHowOften=map['LosePowerHowOften'];
    Drawing=map['Drawing'];
    Notes=map['Notes'];
    PMSignature=map['PMSignature'];
    HomeOwnerSignature=map['HomeOwnerSignature'];
    CreatedBy=map['CreatedBy'];
    InspectionPhoto=map['InspectionPhoto'];

  }


}