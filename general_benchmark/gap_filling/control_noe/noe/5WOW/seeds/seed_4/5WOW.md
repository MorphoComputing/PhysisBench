# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\5WOW\seeds\seed_4\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 7.118 A
- tm_score_ca_ordered: 0.12132677995182051
- heavy_atom_rmsd: 7.905 A
- sidechain_heavy_atom_rmsd: 8.665 A
- **all-atom quality (honest):** heavy 7.905 A, sidechain 8.665 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 28
- distogram_pairs: 27
- bin_accuracy: 0.444

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.027), conflicts/hub=1.0, max_incompat=3.61Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y27** — severity 1.56, 1 conflict(s); suspect input ~`R9` (group: pull_in)
  - pull-in (wants closer): R23@3.8Å(now 6.8,conf 0.58)
  - R23↔R9: targets 3.8/4.1Å but partners are 11.6Å apart → too_far_apart by 3.6Å

## Secondary Structure (DSSP-like)

- helix(H)=33 · strand(E)=4 · 3-10(G)=0 · coil(C)=0

```
EHHHHHHHEHHHHHHHHHHHHHHHHHHHHEHHHHHHE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=23 · sheet=2
  - V2 ↔ I6  (helix)
  - C3 ↔ L7  (helix)
  - P4 ↔ Q8  (helix)
  - I6 ↔ C10  (helix)
  - L7 ↔ R11  (helix)
  - Q8 ↔ R12  (helix)
  - C10 ↔ S14  (helix)
  - R12 ↔ C16  (helix)
  - D13 ↔ P17  (helix)
  - S14 ↔ G18  (helix)
  - C16 ↔ C20  (helix)
  - P17 ↔ I21  (helix)
  - A19 ↔ R23  (helix)
  - C20 ↔ G24  (helix)
  - I21 ↔ N25  (helix)
  - R23 ↔ Y27  (helix)
  - G24 ↔ C28  (helix)
  - N25 ↔ G29  (helix)
  - Y27 ↔ P31  (helix)
  - C28 ↔ Y32  (helix)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=397 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=270 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3109 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=28 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
