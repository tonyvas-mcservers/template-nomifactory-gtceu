import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.contenttweaker.Fluid;
import crafttweaker.recipes.IRecipeFunction;

import mods.gregtech.recipe.RecipeMap;

import scripts.common.makeShapedF as makeShapedF;

//////////////////////////////////////////////////////////////
/////////////       Thermal Expansion       //////////////////
//////////////////////////////////////////////////////////////


mods.jei.JEI.removeAndHide(<thermalexpansion:augment:256>);
mods.jei.JEI.removeAndHide(<thermalexpansion:augment:257>);

mods.jei.JEI.removeAndHide(<thermalexpansion:augment:303>);

recipes.removeByRecipeName("extendedcrafting:diamond_nugget_to");
mods.jei.JEI.removeAndHide(<extendedcrafting:material:129>);
recipes.removeByRecipeName("extendedcrafting:emerald_nugget_to");
recipes.removeByRecipeName("actuallyadditions:recipes146");

//Redstone Servo
recipes.addShaped(<thermalfoundation:material:512>, [
	[<extrautils2:ingredients>,<metaitem:plateElectricalSteel>, <extrautils2:ingredients>],
	[null,<metaitem:plateElectricalSteel>, null],
	[<extrautils2:ingredients>,<metaitem:plateElectricalSteel>, <extrautils2:ingredients>]]);

// remove the wonky 2-tag version from JEI
mods.jei.JEI.removeAndHide(<thermalexpansion:tank>);

// replace tank recipe with 3-tag version
recipes.remove(<thermalexpansion:tank>);
recipes.addShaped(basictank, [
	[<metaitem:plateCopper>, <ore:blockGlassHardened>, <metaitem:plateCopper>],
	[<ore:blockGlassHardened>,null,<ore:blockGlassHardened>],
	[<metaitem:plateCopper>, <thermalfoundation:material:512>, <metaitem:plateCopper>]]);

function updateTank(level as byte) as IRecipeFunction {
    return function(out, ins, cInfo) as IItemStack {
        return ins.tank.updateTag({Level: level});
    };
}

var tankShape as string[] = ["ABA",
                             "BCB",
                             "ABA"];

makeShapedF("of_hardenedtank",
    hardenedtank,
    tankShape,
    { A : <actuallyadditions:item_crystal:1>,
      B : <metaitem:plateInvar>,
      C : basictankIng.marked("tank")},
    updateTank(1)
);

makeShapedF("of_reinforcedtank",
    reinforcedtank,
    tankShape,
    { A : <thermalfoundation:material:1026>,
      B : <metaitem:plateElectrum>,
      C : hardenedtankIng.marked("tank")},
    updateTank(2)
);

makeShapedF("of_signalumtank",
    signalumtank,
    tankShape,
    { A : <thermalfoundation:material:1027>,
      B : <ore:plateSignalum>,
      C : reinforcedtankIng.marked("tank")},
    updateTank(3)
);

makeShapedF("of_resonanttank",
    resonanttank,
    tankShape,
    { A : <thermalfoundation:material:1024>,
      B : <ore:plateEnderium>,
      C : signalumtankIng.marked("tank")},
    updateTank(4)
);


mods.jei.JEI.addItem(basictank);
mods.jei.JEI.addItem(hardenedtank);
mods.jei.JEI.addItem(reinforcedtank);
mods.jei.JEI.addItem(signalumtank);
mods.jei.JEI.addItem(resonanttank);

//mods.jei.JEI.addItem(<gregtech:meta_tool:7>.withTag({RandomKey: -9206505693458694257 as long, CreatorMost: -5567380206174582019 as long, CraftingComponents: [{id: "gregtech:meta_item_1", Count: 1 as byte, Damage: 10152 as short}, {id: "gregtech:meta_item_1", Count: 1 as byte, Damage: 10152 as short}, {id: "gregtech:meta_item_1", Count: 1 as byte, Damage: 10152 as short}, {id: "gregtech:meta_item_1", Count: 1 as byte, Damage: 10152 as short}, {id: "minecraft:stick", Count: 1 as byte, Damage: 0 as short}, {id: "gregtech:meta_item_1", Count: 1 as byte, Damage: 10152 as short}, {id: "gregtech:meta_item_1", Count: 1 as byte, Damage: 10152 as short}], "GT.ToolStats": {PrimaryMaterial: "rubber", HandleMaterial: "wood"}, CreatorLeast: -6837252790035570724 as long}));

//Steam Dynamo
recipes.remove(<thermalexpansion:dynamo>);
recipes.addShaped(<thermalexpansion:dynamo>, [
	[null, <contenttweaker:excitationcoil>, null],
	[<ore:plateCopper>, <morefurnaces:furnaceblock>, <ore:plateCopper>],
	[<metaitem:gearWroughtIron>, <thermalfoundation:material:514>, <metaitem:gearWroughtIron>]]);

//Magmatic Dynamo
recipes.remove(<thermalexpansion:dynamo:1>);
recipes.addShaped(<thermalexpansion:dynamo:1>, [
	[null, <contenttweaker:excitationcoil>, null],
	[<metaitem:plateDarkSteel>, <morefurnaces:furnaceblock:5>, <metaitem:plateDarkSteel>],
	[<enderio:item_material:73>, <thermalfoundation:material:514>, <enderio:item_material:73>]]);

//Reactant Dynamo
recipes.remove(<thermalexpansion:dynamo:3>);
recipes.addShaped(<thermalexpansion:dynamo:3>, [
	[null, <contenttweaker:excitationcoil>, null],
	[<metaitem:plateEnergeticAlloy>, <morefurnaces:furnaceblock:1>, <metaitem:plateEnergeticAlloy>],
	[<enderio:item_material:12>, <thermalfoundation:material:514>, <enderio:item_material:12>]]);

//hardened upgrade
recipes.remove(<thermalfoundation:upgrade>);
recipes.addShaped(<thermalfoundation:upgrade>, [
	[<metaitem:gearInvar>, <metaitem:plateInvar>, <metaitem:gearInvar>],
	[<metaitem:plateInvar>, <metaitem:blockElectricalSteel>, <metaitem:plateInvar>],
	[<metaitem:gearInvar>, <metaitem:plateInvar>, <metaitem:gearInvar>]]);

//reinforced upgrade
recipes.remove(<thermalfoundation:upgrade:1>);
recipes.addShaped(<thermalfoundation:upgrade:1>, [
	[<metaitem:gearElectrum>, <metaitem:plateElectrum>, <metaitem:gearElectrum>],
	[<metaitem:plateElectrum>, <metaitem:blockAluminium>, <metaitem:plateElectrum>],
	[<metaitem:gearElectrum>, <metaitem:plateElectrum>, <metaitem:gearElectrum>]]);

//sig upgrade
recipes.remove(<thermalfoundation:upgrade:2>);
recipes.addShaped(<thermalfoundation:upgrade:2>, [
	[<moreplates:restonia_gear>, <metaitem:plateSignalum>, <moreplates:restonia_gear>],
	[<metaitem:plateSignalum>, <ore:blockLumium>, <metaitem:plateSignalum>],
	[<moreplates:restonia_gear>, <metaitem:plateSignalum>, <moreplates:restonia_gear>]]);

//end upgrade
recipes.remove(<thermalfoundation:upgrade:3>);
recipes.addShaped(<thermalfoundation:upgrade:3>, [
	[<moreplates:emeradic_gear>, <metaitem:plateEnderium>, <moreplates:emeradic_gear>],
	[<metaitem:plateEnderium>, <draconicevolution:draconic_core>, <metaitem:plateEnderium>],
	[<moreplates:emeradic_gear>, <metaitem:plateEnderium>, <moreplates:emeradic_gear>]]);

//Silver Transmission Coil
recipes.remove(<thermalfoundation:material:514>);
recipes.addShaped(<thermalfoundation:material:514>, [
	[null, <minecraft:redstone>, <metaitem:stickSilver>],
	[<minecraft:redstone>, <metaitem:stickSilver>, <minecraft:redstone>],
	[<metaitem:stickSilver>, <minecraft:redstone>, null]]);

//Gold Reception Coil
recipes.remove(<thermalfoundation:material:513>);
recipes.addShaped(<thermalfoundation:material:513>, [
	[null, <minecraft:redstone>, <metaitem:stickElectrum>],
	[<minecraft:redstone>, <metaitem:stickElectrum>, <minecraft:redstone>],
	[<metaitem:stickElectrum>, <minecraft:redstone>, null]]);

//Auxiliary Transmission Coil
recipes.remove(<thermalexpansion:augment:512>);
recipes.addShaped(<thermalexpansion:augment:512>, [
	[<metaitem:ingotSterlingSilver>, <ore:ingotEnergeticAlloy>, <ore:blockConductiveIron>],
	[<ore:ingotEnergeticAlloy>, <thermalfoundation:material:514>, <ore:ingotEnergeticAlloy>],
	[<ore:blockConductiveIron>, <ore:ingotEnergeticAlloy>, <metaitem:ingotSterlingSilver>]]);

//Auxiliary Reception Coil
recipes.remove(<thermalexpansion:augment:128>);
recipes.addShaped(<thermalexpansion:augment:128>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <thermalfoundation:material:513>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);

//Auxiliary Sieve
recipes.remove(<thermalexpansion:augment:129>);
recipes.addShaped(<thermalexpansion:augment:129>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <thermalfoundation:material:512>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);

//Nullification Chamber
recipes.remove(<thermalexpansion:augment:130>);
recipes.addShaped(<thermalexpansion:augment:130>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <extrautils2:trashcan>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);

//Nutrient Recovery
recipes.remove(<thermalexpansion:augment:320>);
recipes.addShaped(<thermalexpansion:augment:320>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <thermalfoundation:fertilizer:1>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);

//Monoculture
recipes.remove(<thermalexpansion:augment:324>);
recipes.addShaped(<thermalexpansion:augment:324>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <thermalfoundation:fertilizer:2>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);

//Sapling Infuser
recipes.remove(<thermalexpansion:augment:323>);
recipes.addShaped(<thermalexpansion:augment:323>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <ore:treeSapling>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);

//Gear Making Thing
recipes.remove(<thermalexpansion:augment:337>);
recipes.addShaped(<thermalexpansion:augment:337>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <metaitem:gearDiamond>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);


//Pyroconductive Loop
recipes.remove(<thermalexpansion:augment:352>);
recipes.addShaped(<thermalexpansion:augment:352>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <minecraft:lava_bucket>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);

//charger thing
recipes.remove(<thermalexpansion:augment:400>);
recipes.addShaped(<thermalexpansion:augment:400>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <appliedenergistics2:charger>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);

//repair thing
recipes.remove(<thermalexpansion:augment:401>);
recipes.addShaped(<thermalexpansion:augment:401>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <actuallyadditions:item_solidified_experience>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);

//hopper thing
recipes.remove(<thermalexpansion:augment:514>);
recipes.addShaped(<thermalexpansion:augment:514>, [
	[<minecraft:iron_ingot>, <metaitem:plateIron>, <minecraft:iron_ingot>],
	[<metaitem:plateIron>, <minecraft:hopper>, <metaitem:plateIron>],
	[<minecraft:iron_ingot>, <metaitem:plateIron>, <minecraft:iron_ingot>]]);

	//reagent thing
recipes.remove(<thermalexpansion:augment:448>);
recipes.addShaped(<thermalexpansion:augment:448>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <minecraft:dye:4>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);

	//i give up
recipes.remove(<thermalexpansion:augment:656>);
recipes.addShaped(<thermalexpansion:augment:656>, [
	[<ore:ingotDarkSteel>, <metaitem:plateDarkSteel>, <ore:ingotDarkSteel>],
	[<metaitem:plateDarkSteel>, <thermalfoundation:material:1024>, <metaitem:plateDarkSteel>],
	[<ore:ingotDarkSteel>, <metaitem:plateDarkSteel>, <ore:ingotDarkSteel>]]);

	//i give up
recipes.remove(<thermalexpansion:augment:496>);
recipes.addShaped(<thermalexpansion:augment:496>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <minecraft:water_bucket>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);

	//i give up
recipes.remove(<thermalexpansion:augment:688>);
recipes.addShaped(<thermalexpansion:augment:688>, [
	[<ore:plateElectrumFlux>, <ore:plateElectrumFlux>, <ore:plateElectrumFlux>],
	[<ore:plateElectrumFlux>, <thermalfoundation:material:1028>, <ore:plateElectrumFlux>],
	[<ore:plateElectrumFlux>, <ore:plateElectrumFlux>, <ore:plateElectrumFlux>]]);

	//i give up
recipes.remove(<thermalexpansion:augment:402>);
recipes.addShaped(<thermalexpansion:augment:402>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <thermalexpansion:capacitor>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);

	//fuel catalyzer
recipes.remove(<thermalexpansion:augment:513>);
recipes.addShaped(<thermalexpansion:augment:513>, [
	[<ore:ingotWroughtIron>, <ore:plateWroughtIron>, <ore:ingotWroughtIron>],
	[<ore:plateWroughtIron>, <thermalfoundation:material:515>, <ore:plateWroughtIron>],
	[<ore:ingotWroughtIron>, <ore:plateWroughtIron>, <ore:ingotWroughtIron>]]);

	//excitation field limiter
recipes.remove(<thermalexpansion:augment:515>);
recipes.addShaped(<thermalexpansion:augment:515>, [
	[<minecraft:iron_ingot>, <metaitem:plateIron>, <minecraft:iron_ingot>],
	[<metaitem:plateIron>, <contenttweaker:excitationcoil>, <metaitem:plateIron>],
	[<minecraft:iron_ingot>, <metaitem:plateIron>, <minecraft:iron_ingot>]]);

	//i give up
recipes.remove(<thermalexpansion:augment:720>);
recipes.addShaped(<thermalexpansion:augment:720>, [
	[<ore:plateDiamond>, <ore:plateDiamond>, <ore:plateDiamond>],
	[<ore:plateDiamond>, <minecraft:emerald>, <ore:plateDiamond>],
	[<ore:plateDiamond>, <ore:plateDiamond>, <ore:plateDiamond>]]);

	//i give up
recipes.remove(<thermalexpansion:augment:497>);
recipes.addShaped(<thermalexpansion:augment:497>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <minecraft:cobblestone>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);

	//excitation coil
recipes.addShaped(<contenttweaker:excitationcoil>, [
	[null, <metaitem:plateRedAlloy>, null],
	[<metaitem:plateRedAlloy>, <thermalfoundation:material:515>, <metaitem:plateRedAlloy>],
	[<metaitem:plateRedAlloy>, <thermalfoundation:material:515>, <metaitem:plateRedAlloy>]]);

<contenttweaker:excitationcoil>.addTooltip(format.darkGray(format.italic("Crafting component only.")));

// Boiler Conversion
recipes.removeByRecipeName("thermalexpansion:augment_25");
recipes.addShaped(<thermalexpansion:augment:576>, [
	[null, <ore:gearIron>, null],
	[<ore:plateCopper>, <minecraft:bucket>, <ore:plateCopper>],
	[null, <ore:blockGlassHardened>, null]
]);

recipes.addShaped(<thermalfoundation:material:515>, [
	[<metaitem:stickGold>, <minecraft:redstone>, null],
	[<minecraft:redstone>, <metaitem:stickGold>, <minecraft:redstone>],
	[null, <minecraft:redstone>, <metaitem:stickGold>]]);


mods.jei.JEI.removeAndHide(<thermalexpansion:augment:258>);
mods.jei.JEI.removeAndHide(<thermalexpansion:augment:273>);
mods.jei.JEI.removeAndHide(<thermalexpansion:augment:288>);
mods.jei.JEI.removeAndHide(<thermalexpansion:augment:304>);
mods.jei.JEI.removeAndHide(<thermalexpansion:augment:416>);
mods.jei.JEI.removeAndHide(<thermalexpansion:augment:368>);
mods.jei.JEI.removeAndHide(<thermalexpansion:augment:369>);
mods.jei.JEI.removeAndHide(<thermalexpansion:augment:432>);
mods.jei.JEI.removeAndHide(<thermalexpansion:augment:433>);
mods.jei.JEI.removeAndHide(<thermalexpansion:augment:673>);
mods.jei.JEI.removeAndHide(<thermalexpansion:augment:674>);

//coin thing
recipes.remove(<thermalexpansion:augment:336>);
recipes.addShaped(<thermalexpansion:augment:336>, [
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>],
	[<thermalfoundation:material:328>, <minecraft:gold_block>, <thermalfoundation:material:328>],
	[<thermalfoundation:material:136>, <thermalfoundation:material:328>, <thermalfoundation:material:136>]]);

//Trash Can (Items)
recipes.remove(<extrautils2:trashcan>);
recipes.addShaped(<extrautils2:trashcan>, [
	[null, <minecraft:iron_trapdoor>, null],
	[<metaitem:plateIron>, <minecraft:chest>, <metaitem:plateIron>],
	[null, <metaitem:plateIron>, null]]);

//Trash Can (Fluid)
recipes.remove(<extrautils2:trashcanfluid>);
recipes.addShaped(<extrautils2:trashcanfluid>, [
	[null, <minecraft:iron_trapdoor>, null],
	[<metaitem:plateIron>, <minecraft:bucket>, <metaitem:plateIron>],
	[null, <metaitem:plateIron>, null]]);

//Trash Can (Energy)
recipes.remove(<extrautils2:trashcanenergy>);
recipes.addShaped(<extrautils2:trashcanenergy>, [
	[null, <minecraft:iron_trapdoor>, null],
	[<metaitem:plateIron>, <minecraft:redstone_block>, <metaitem:plateIron>],
	[null, <metaitem:plateIron>, null]]);

//Mana Powder
recipes.addShaped(<thermalfoundation:material:1028> * 4,[
	[<thermalfoundation:material:1026>, <thermalfoundation:material:1026>, <thermalfoundation:material:1024>],
	[<thermalfoundation:material:1025>, <metaitem:dustDiamond>, <thermalfoundation:material:1024>],
	[<thermalfoundation:material:1025>, <thermalfoundation:material:1027>, <thermalfoundation:material:1027>]]);


<thermalfoundation:material:72>.displayName = "Mana Infused Metal Dust";
blast_furnace.recipeBuilder().inputs([<thermalfoundation:material:72>]).fluidInputs(<liquid:mana> * 250).outputs(<thermalfoundation:material:136>).property("temperature", 2141).duration(400).EUt(400).buildAndRegister();

recipes.remove(<thermalexpansion:frame>);
recipes.addShaped(<thermalexpansion:frame>, [
[<metaitem:plateStainlessSteel>,<metaitem:plateStainlessSteel>,<metaitem:plateStainlessSteel>],
[<metaitem:plateStainlessSteel>,<thermalexpansion:frame:64>,<metaitem:plateStainlessSteel>],
[<metaitem:plateStainlessSteel>,<metaitem:plateStainlessSteel>,<metaitem:plateStainlessSteel>]]);
<thermalexpansion:frame:64>.displayName = "Thermal Machine Casing";

recipes.remove(<thermalexpansion:frame:64>);
recipes.addShaped(<thermalexpansion:frame:64>, [
	[<thermalfoundation:material:136>,<thermalfoundation:material:136>,<thermalfoundation:material:136>],
	[<thermalfoundation:material:136>, null, <thermalfoundation:material:136>],
	[<thermalfoundation:material:136>,<thermalfoundation:material:136>,<thermalfoundation:material:136>]]);
<thermalexpansion:frame:64>.displayName = "Thermal Device Casing";


//Add Black Lotus to Phytogenic Insolator for black dye
mods.thermalexpansion.Insolator.addRecipe(<actuallyadditions:block_black_lotus>*3,<actuallyadditions:block_black_lotus>, <thermalfoundation:fertilizer:0>, 4800);
mods.thermalexpansion.Insolator.addRecipe(<actuallyadditions:block_black_lotus>*6,<actuallyadditions:block_black_lotus>, <thermalfoundation:fertilizer:1>, 7200);
mods.thermalexpansion.Insolator.addRecipe(<actuallyadditions:block_black_lotus>*9,<actuallyadditions:block_black_lotus>, <thermalfoundation:fertilizer:2>, 9600);


//Mana Infused
mixer.recipeBuilder()
    .outputs(<thermalfoundation:material:72> * 2)
    .inputs([<thermalfoundation:material:1028>, <metaitem:dustTitanium>])
    .duration(200).EUt(30).buildAndRegister();

//Remove Unobtainable Satchel and Void Satchel Recipe

//Remove Rockwool smelting recipe
furnace.remove(<thermalfoundation:rockwool:7>, <thermalfoundation:material:864>);

//Satchel Removal
recipes.removeByRecipeName("thermalexpansion:satchel_1");
recipes.removeByRecipeName("thermalexpansion:satchel_7");

//Charged Certus
mods.thermalexpansion.Infuser.addRecipe(<appliedenergistics2:material:1>, <metaitem:gemCertusQuartz>, 1000);

//Pure Certus
mods.thermalexpansion.Insolator.addRecipe(<appliedenergistics2:material:10>, <appliedenergistics2:crystal_seed>.withTag({progress: 0}), <minecraft:glowstone_dust>, 40000);

//Pure Nether Quartz
mods.thermalexpansion.Insolator.addRecipe(<appliedenergistics2:material:11>, <appliedenergistics2:crystal_seed:600>.withTag({progress: 600}), <minecraft:glowstone_dust>, 40000);

//Pure Fluix
mods.thermalexpansion.Insolator.addRecipe(<appliedenergistics2:material:12>, <appliedenergistics2:crystal_seed:1200>.withTag({progress: 1200}), <minecraft:glowstone_dust>, 40000);

mods.jei.JEI.addDescription(<appliedenergistics2:material:10>, "Made in the Crystal Growth Chamber or in a Phytogenic Insolator. If made in the Phytogenic Insolator, make sure to unlock the Fertilizer slot. Augments do not work for this craft.");
mods.jei.JEI.addDescription(<appliedenergistics2:material:11>, "Made in the Crystal Growth Chamber or in a Phytogenic Insolator. If made in the Phytogenic Insolator, make sure to unlock the Fertilizer slot. Augments do not work for this craft.");
mods.jei.JEI.addDescription(<appliedenergistics2:material:12>, "Made in the Crystal Growth Chamber or in a Phytogenic Insolator. If made in the Phytogenic Insolator, make sure to unlock the Fertilizer slot. Augments do not work for this craft.");


//Add Rubber Trees to Phytogenic Insolator. Why would you use this?
mods.thermalexpansion.Insolator.addRecipeSaplingInfuser(<gregtech:rubber_log> * 6, <gregtech:rubber_sapling>, <thermalfoundation:fertilizer:0>, 9600, <gregtech:rubber_sapling>, 100);
mods.thermalexpansion.Insolator.addRecipeSaplingInfuser(<gregtech:rubber_log> * 12, <gregtech:rubber_sapling>, <thermalfoundation:fertilizer:1>, 14400, <gregtech:rubber_sapling>, 125);
mods.thermalexpansion.Insolator.addRecipeSaplingInfuser(<gregtech:rubber_log> * 18, <gregtech:rubber_sapling>, <thermalfoundation:fertilizer:2>, 19200, <gregtech:rubber_sapling>, 150);
