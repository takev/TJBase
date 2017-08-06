// CompareResult - A Swift package with same basic utilities and types.
// Copyright (C) 2017  Tjienta Vara
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

enum CompareResult {
    case Lower
    case Same
    case Higher
}

enum RangeCompareResult {
    case Lower              // The primary range is not overlapping and lower than the secondary range.
    case OverlapLower       // The primary range is overlapping and lower than the secondary range.
    case FullOverlapLower   // The primary range is fully overlapping with the secondary range and extending on the lower side.
    case InsideLowerEdge    // The primary range is inside the secondary range and touching the lower edge.
    case FullOverlap        // The primary range is fully overlapping with the secondary range and extending on both sides.
    case Same               // The primary range is inside the secondary range and touching both edges.
    case Inside             // The primary range is inside the secondary range but not touching either edge.
    case InsideHigherEdge   // The primary range is inside the secondary range and touching the higher edge.
    case FullOverlapHigher  // The primary range is fully overlapping with the secondary range and extending on the higher side.
    case OverlapHigher      // The primary range is overlapping and higher than the secondary range.
    case Higher             // The primary range is not overlapping and lower than the secondary range.
}


