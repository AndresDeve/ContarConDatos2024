ol.proj.proj4.register(proj4);
//ol.proj.get("EPSG:4326").setExtent([-166.107819, -96.404762, 182.820589, 108.938062]);
var wms_layers = [];


        var lyr_ESRIGraylight_0 = new ol.layer.Tile({
            'title': 'ESRI Gray (light)',
            //'type': 'base',
            'opacity': 1.000000,
            
            
            source: new ol.source.XYZ({
    attributions: ' ',
                url: 'http://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}'
            })
        });
var lyr_Probabilidaddeinvasin_1 = new ol.layer.Image({
                            opacity: 1,
                            title: "Probabilidad de invasión",
                            
                            
                            source: new ol.source.ImageStatic({
                               url: "./layers/Probabilidaddeinvasin_1.png",
    attributions: ' ',
                                projection: 'EPSG:4326',
                                alwaysInRange: true,
                                imageExtent: [-179.213899, -85.160289, 180.112214, 85.789110]
                            })
                        });
var format_Presencia_2 = new ol.format.GeoJSON();
var features_Presencia_2 = format_Presencia_2.readFeatures(json_Presencia_2, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:4326'});
var jsonSource_Presencia_2 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_Presencia_2.addFeatures(features_Presencia_2);
var lyr_Presencia_2 = new ol.layer.Vector({
                declutter: false,
                source:jsonSource_Presencia_2, 
                style: style_Presencia_2,
                popuplayertitle: "Presencia",
                interactive: true,
                title: '<img src="styles/legend/Presencia_2.png" /> Presencia'
            });

lyr_ESRIGraylight_0.setVisible(false);
var layersList = [
    lyr_Probabilidaddeinvasin_1,
    lyr_Presencia_2,
    lyr_ESRIGraylight_0 // Esta capa se mantiene desactivada por defecto
];
lyr_Presencia_2.set('fieldAliases', {'fid': 'fid', 'SpecimenCode': 'SpecimenCode', 'Subfamily': 'Subfamily', 'Genus': 'Genus', 'Species': 'Species', 'LifeStageSex': 'LifeStageSex', 'Medium': 'Medium', 'SpecimenNotes': 'SpecimenNotes', 'DNANotes': 'DNANotes', 'LocatedAt': 'LocatedAt', 'OwnedBy': 'OwnedBy', 'TypeStatus': 'TypeStatus', 'DeterminedBy': 'DeterminedBy', 'DateDetermined': 'DateDetermined', 'CollectionCode': 'CollectionCode', 'CollectedBy': 'CollectedBy', 'DateCollectedStart': 'DateCollectedStart', 'DateCollectedEnd': 'DateCollectedEnd', 'Method': 'Method', 'Habitat': 'Habitat', 'Microhabitat': 'Microhabitat', 'CollectionNotes': 'CollectionNotes', 'LocalityName': 'LocalityName', 'Adm1': 'Adm1', 'Adm2': 'Adm2', 'Country': 'Country', 'Elevation': 'Elevation', 'ElevationMaxError': 'ElevationMaxError', 'LocLatitude': 'LocLatitude', 'LocLongitude': 'LocLongitude', 'LatLonMaxError': 'LatLonMaxError', 'Bioregion': 'Bioregion', 'LocalityNotes': 'LocalityNotes', 'LocalityCode': 'LocalityCode', 'Created': 'Created', 'uploadId': 'uploadId', 'Año': 'Año', });
lyr_Presencia_2.set('fieldImages', {'fid': '', 'SpecimenCode': 'TextEdit', 'Subfamily': 'TextEdit', 'Genus': 'TextEdit', 'Species': 'TextEdit', 'LifeStageSex': 'TextEdit', 'Medium': 'TextEdit', 'SpecimenNotes': 'TextEdit', 'DNANotes': 'TextEdit', 'LocatedAt': 'TextEdit', 'OwnedBy': 'TextEdit', 'TypeStatus': 'TextEdit', 'DeterminedBy': 'TextEdit', 'DateDetermined': 'TextEdit', 'CollectionCode': 'TextEdit', 'CollectedBy': 'TextEdit', 'DateCollectedStart': 'DateTime', 'DateCollectedEnd': 'TextEdit', 'Method': 'TextEdit', 'Habitat': 'TextEdit', 'Microhabitat': 'TextEdit', 'CollectionNotes': 'TextEdit', 'LocalityName': 'TextEdit', 'Adm1': 'TextEdit', 'Adm2': 'TextEdit', 'Country': 'TextEdit', 'Elevation': 'TextEdit', 'ElevationMaxError': 'TextEdit', 'LocLatitude': 'TextEdit', 'LocLongitude': 'TextEdit', 'LatLonMaxError': 'TextEdit', 'Bioregion': 'TextEdit', 'LocalityNotes': 'TextEdit', 'LocalityCode': 'TextEdit', 'Created': 'DateTime', 'uploadId': 'Range', 'Año': '', });
lyr_Presencia_2.set('fieldLabels', {'fid': 'hidden field', 'SpecimenCode': 'hidden field', 'Subfamily': 'hidden field', 'Genus': 'hidden field', 'Species': 'hidden field', 'LifeStageSex': 'hidden field', 'Medium': 'hidden field', 'SpecimenNotes': 'hidden field', 'DNANotes': 'hidden field', 'LocatedAt': 'hidden field', 'OwnedBy': 'hidden field', 'TypeStatus': 'hidden field', 'DeterminedBy': 'hidden field', 'DateDetermined': 'hidden field', 'CollectionCode': 'hidden field', 'CollectedBy': 'hidden field', 'DateCollectedStart': 'hidden field', 'DateCollectedEnd': 'hidden field', 'Method': 'hidden field', 'Habitat': 'hidden field', 'Microhabitat': 'hidden field', 'CollectionNotes': 'hidden field', 'LocalityName': 'hidden field', 'Adm1': 'hidden field', 'Adm2': 'hidden field', 'Country': 'hidden field', 'Elevation': 'hidden field', 'ElevationMaxError': 'hidden field', 'LocLatitude': 'hidden field', 'LocLongitude': 'hidden field', 'LatLonMaxError': 'hidden field', 'Bioregion': 'hidden field', 'LocalityNotes': 'hidden field', 'LocalityCode': 'hidden field', 'Created': 'hidden field', 'uploadId': 'hidden field', 'Año': 'inline label - visible with data', });
lyr_Presencia_2.on('precompose', function(evt) {
    evt.context.globalCompositeOperation = 'normal';
});