# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_fused\1JRJ\seeds\seed_6\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.448 A
- tm_score_ca_ordered: 0.3630125023759795
- heavy_atom_rmsd: 4.875 A
- sidechain_heavy_atom_rmsd: 5.955 A
- **all-atom quality (honest):** heavy 4.875 A, sidechain 5.955 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 196
- bin_accuracy: 0.776

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** K26-N27 → 6 conflicts (75%)
- explained: 6/8 conflicts by 1 root cause(s)
- metrics: hubs=6 (frac 0.162), conflicts/hub=1.3, max_incompat=3.37Å, chain_span=0.378
- **fix-first:** [LOW_CONFLICT] Root cause(s): K26-N27 — explain ~6/8 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I22** — severity 3.30, 2 conflict(s); suspect input ~`R19` (group: push_out)
  - pull-in (wants closer): K26@6.1Å(now 8.7,conf 0.70)
  - push-out (wants farther): L20@5.4Å(now 1.6,conf 0.54)
  - R19↔K26: targets 5.0/6.1Å but partners are 13.9Å apart → too_far_apart by 2.8Å
  - K26↔G33: targets 6.1/15.4Å but partners are 7.0Å apart → too_close_together by 2.2Å
- **N27** — severity 2.90, 2 conflict(s); suspect input ~`E23` (group: pull_in)
  - pull-in (wants closer): E23@6.1Å(now 8.7,conf 0.70)
  - T4↔E23: targets 37.4/6.1Å but partners are 28.8Å apart → too_close_together by 2.4Å
  - E23↔E14: targets 6.1/20.6Å but partners are 12.7Å apart → too_close_together by 1.8Å
- **E23** — severity 1.90, 1 conflict(s); suspect input ~`P30` (group: pull_in)
  - pull-in (wants closer): N27@6.1Å(now 8.7,conf 0.70)
  - N27↔P30: targets 6.1/12.0Å but partners are 2.8Å apart → too_close_together by 3.1Å
- **K26** — severity 1.87, 1 conflict(s); suspect input ~`L25` (group: push_out)
  - pull-in (wants closer): I22@6.1Å(now 8.7,conf 0.70)
  - push-out (wants farther): P36@11.4Å(now 7.5,conf 0.62)
  - P36↔L25: targets 11.4/3.8Å but partners are 4.2Å apart → too_close_together by 3.4Å
- **W24** — severity 1.62, 1 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): A34@6.1Å(now 8.7,conf 0.70)
  - A34↔R19: targets 6.1/8.6Å but partners are 17.3Å apart → too_far_apart by 2.6Å
- **M13** — severity 1.27, 1 conflict(s); suspect input ~`A34` (group: pull_in)
  - pull-in (wants closer): A34@21.9Å(now 25.0,conf 0.68)
  - S10↔A34: targets 5.4/21.9Å but partners are 29.1Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=11 · 3-10(G)=7 · coil(C)=1

```
EEEHHHEHGHHEHHHEHGHHHHEHGGEHHGHEGCEGE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=9 · sheet=9
  - T4 ↔ D8  (helix)
  - T6 ↔ S10  (helix)
  - S10 ↔ E14  (helix)
  - K11 ↔ E15  (helix)
  - M13 ↔ A17  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - L20 ↔ W24  (helix)
  - W24 ↔ G28  (helix)
  - E2 ↔ S7  (sheet)
  - S7 ↔ Q12  (sheet)
  - E16 ↔ E23  (sheet)
  - E23 ↔ S32  (sheet)
  - E23 ↔ P35  (sheet)
  - E23 ↔ P37  (sheet)
  - N27 ↔ S32  (sheet)
  - N27 ↔ P35  (sheet)
  - N27 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=18 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=122 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=28 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7789 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
