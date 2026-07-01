# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_fused\1JRJ\seeds\seed_1\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.642 A
- tm_score_ca_ordered: 0.3789475334853387
- heavy_atom_rmsd: 5.517 A
- sidechain_heavy_atom_rmsd: 6.559 A
- **all-atom quality (honest):** heavy 5.517 A, sidechain 6.559 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 196
- bin_accuracy: 0.791

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/3 conflicts by 0 root cause(s)
- metrics: hubs=3 (frac 0.081), conflicts/hub=1.0, max_incompat=2.46Å, chain_span=0.676
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P36** — severity 1.51, 1 conflict(s); suspect input ~`K26` (group: push_out)
  - push-out (wants farther): K26@11.4Å(now 7.8,conf 0.62)
  - W24↔K26: targets 5.8/11.4Å but partners are 3.1Å apart → too_close_together by 2.5Å
- **K11** — severity 1.43, 1 conflict(s); suspect input ~`S7` (group: push_out)
  - pull-in (wants closer): E14@5.4Å(now 9.1,conf 0.70)
  - push-out (wants farther): L9@5.4Å(now 2.5,conf 0.61)
  - S7↔E14: targets 6.1/5.4Å but partners are 13.6Å apart → too_far_apart by 2.0Å
- **E14** — severity 1.07, 1 conflict(s); suspect input ~`P30` (group: pull_in)
  - pull-in (wants closer): K11@5.4Å(now 9.1,conf 0.70)
  - K11↔P30: targets 5.4/20.9Å but partners are 27.9Å apart → too_far_apart by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=14 · 3-10(G)=3 · coil(C)=1

```
EEEECHHHHHHEEEHEHGHHHHHGHHEHHEHEHEGEE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=10 · sheet=6
  - T6 ↔ S10  (helix)
  - S7 ↔ K11  (helix)
  - K11 ↔ E15  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - R19 ↔ E23  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - L25 ↔ G29  (helix)
  - G29 ↔ G33  (helix)
  - N27 ↔ S32  (sheet)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P36  (sheet)
  - N27 ↔ P37  (sheet)
  - P30 ↔ P36  (sheet)
  - P30 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=20 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=105 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=16 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7404 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
