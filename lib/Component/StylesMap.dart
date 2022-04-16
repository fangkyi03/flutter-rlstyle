import 'package:rlstyles/Component/Styles.dart';

class StylesMap extends Styles {
  static getClass(Map keyName, Map classMap) {
    final arr = [];
    keyName.keys.forEach((element) {
      if (keyName[element] == true) {
        arr.add(element);
      }
    });
    Map obj = {};
    arr.forEach((element) {
      obj = {...obj, ...classMap[element]};
    });
    return obj;
  }

  static formMap(Map mapData) {
    if (mapData.isEmpty) return const Styles();
    return Styles(
        display: mapData['display'] ?? 'flex',
        flexDirection: mapData['flexDirection'] ?? 'col',
        color: mapData['color'],
        flex: mapData['flex'] ?? null,
        width: mapData['width'],
        height: mapData['height'],
        flexWrap: mapData['flexWrap'],
        flexWrapSpacing: mapData['flexWrapSpacing'] ?? 0.0,
        flexWrapRunSpacing: mapData['flexWrapRunSpacing'] ?? 0.0,
        justifyContent: mapData['justifyContent'],
        alignItems: mapData['alignItems'],
        borderRadius: mapData['borderRadius'],
        marginLeft: mapData['marginLeft'],
        marginTop: mapData['marginTop'],
        marginRight: mapData['marginRight'],
        marginBottom: mapData['marginBottom'],
        paddingLeft: mapData['paddingLeft'],
        paddingTop: mapData['paddingTop'],
        paddingRight: mapData['paddingRight'],
        paddingBottom: mapData['paddingBottom'],
        left: mapData['left'],
        top: mapData['top'],
        right: mapData['right'],
        bottom: mapData['bottom'],
        position: mapData['position'] ?? 'rel',
        backgroundImage: mapData['backgroundImage'],
        backgroundColor: mapData['backgroundColor'],
        maxWidth: mapData['maxWidth'],
        maxHeight: mapData['maxHeight'],
        fontSize: mapData['fontSize'],
        textOverflow: mapData['textOverflow'],
        fontWeight: mapData['fontWeight'],
        fontFamily: mapData['fontFamily'],
        whiteSpace: mapData['whiteSpace'],
        lineHeight: mapData['lineHeight'],
        textDecoration: mapData['textDecoration'],
        lines: mapData['lines'],
        boxSizing: mapData['boxSizing'],
        borderWidth: mapData['borderWidth'],
        borderStyle: mapData['borderStyle'] ?? 'solid',
        borderColor: mapData['borderColor'],
        opacity: mapData['opacity'] ?? 1.0,
        boxShadow: mapData['boxShadow'],
        textAlign: mapData['textAlign'],
        minHeight: mapData['minHeight'],
        minWidth: mapData['minWidth'],
        borderBottomLeftRadius: mapData['borderBottomLeftRadius'],
        borderBottomRightRadius: mapData['borderBottomRightRadius'],
        borderLeftStyle: mapData['borderLeftStyle'] ?? 'solid',
        borderLeftColor: mapData['borderLeftColor'],
        borderLeftWidth: mapData['borderLeftWidth'] ?? 1,
        borderRightStyle: mapData['borderRightStyle'] ?? 'solid',
        borderRightColor: mapData['borderRightColor'],
        borderRightWidth: mapData['borderRightWidth'] ?? 1,
        borderTopStyle: mapData['borderTopStyle'] ?? 'solid',
        borderTopColor: mapData['borderTopColor'],
        borderTopWidth: mapData['borderTopWidth'] ?? 1,
        borderBottomStyle: mapData['borderBottomStyle'] ?? 'solid',
        borderBottomColor: mapData['borderBottomColor'],
        borderBottomWidth: mapData['borderBottomWidth'] ?? 1,
        borderTopLeftRadius: mapData['borderTopLeftRadius'],
        borderTopRightRadius: mapData['borderTopRightRadius'],
        overflowY: mapData['overflowY'],
        overflowX: mapData['overflowX'],
        letterSpacing: mapData['letterSpacing'],
        transform: mapData['transform'],
        backgroundSize: mapData['backgroundSize'],
        margin: mapData['margin'],
        padding: mapData['padding'],
        elevation: mapData['elevation'],
        zIndex: mapData['zIndex'] ?? 1,
        gridCount: mapData['gridCount'],
        gridMainAxisSpacing: mapData['gridMainAxisSpacing'],
        gridCrossAxisSpacing: mapData['gridCrossAxisSpacing'],
        gridChildAspectRatio: mapData['gridChildAspectRatio'],
        scrollBar: mapData['scrollBar'] != null ? mapData['scrollBar'] : true);
  }
}
