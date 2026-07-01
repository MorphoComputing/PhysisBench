# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1VII\seeds\seed_6\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 5.089 A
- tm_score_ca_ordered: 0.16621528082570067
- heavy_atom_rmsd: 6.330 A
- sidechain_heavy_atom_rmsd: 7.237 A
- **all-atom quality (honest):** heavy 6.330 A, sidechain 7.237 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 19
- distogram_pairs: 51
- bin_accuracy: 0.392

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** L28-K29 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.059), conflicts/hub=1.5, max_incompat=2.74Å, chain_span=0.529
- **fix-first:** [LOW_CONFLICT] Root cause(s): L28-K29 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F10** — severity 1.07, 2 conflict(s); suspect input ~`L1` (group: pull_in)
  - pull-in (wants closer): K29@4.9Å(now 7.5,conf 0.35), L1@5.2Å(now 8.7,conf 0.26), R14@5.2Å(now 8.8,conf 0.26)
  - K29↔L1: targets 4.9/5.2Å but partners are 12.8Å apart → too_far_apart by 2.7Å
  - K29↔F6: targets 4.9/5.5Å but partners are 12.0Å apart → too_far_apart by 1.6Å
- **L28** — severity 0.78, 1 conflict(s); suspect input ~`Q25` (group: pull_in)
  - pull-in (wants closer): K32@4.0Å(now 8.4,conf 0.45), E31@4.3Å(now 7.5,conf 0.41)
  - K32↔Q25: targets 4.0/4.3Å but partners are 10.3Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=7 · 3-10(G)=1 · coil(C)=2

```
CHHEHHHHEHHHHEHEHHHHHEHHHHHGHHEEHC
```

## Backbone H-bond Network

- total=29 · helix(i→i+4)=14 · sheet=15
  - S2 ↔ F6  (helix)
  - D3 ↔ K7  (helix)
  - F6 ↔ F10  (helix)
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - S15 ↔ N19  (helix)
  - F17 ↔ P21  (helix)
  - N19 ↔ W23  (helix)
  - L20 ↔ K24  (helix)
  - P21 ↔ Q25  (helix)
  - W23 ↔ N27  (helix)
  - Q25 ↔ K29  (helix)
  - Q26 ↔ K30  (helix)
  - K29 ↔ G33  (helix)
  - E4 ↔ V9  (sheet)
  - E4 ↔ R14  (sheet)
  - E4 ↔ A16  (sheet)
  - E4 ↔ L22  (sheet)
  - V9 ↔ R14  (sheet)
  - V9 ↔ A16  (sheet)
  - … +9 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=243 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=141 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3916 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=19 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
