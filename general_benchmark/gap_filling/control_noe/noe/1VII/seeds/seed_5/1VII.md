# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1VII\seeds\seed_5\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 5.392 A
- tm_score_ca_ordered: 0.13059040926562795
- heavy_atom_rmsd: 6.953 A
- sidechain_heavy_atom_rmsd: 8.176 A
- **all-atom quality (honest):** heavy 6.953 A, sidechain 8.176 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 25
- distogram_pairs: 51
- bin_accuracy: 0.588

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.029), conflicts/hub=1.0, max_incompat=1.86Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F17** — severity 0.66, 1 conflict(s); suspect input ~`F6` (group: pull_in)
  - pull-in (wants closer): Q25@4.7Å(now 7.2,conf 0.38)
  - Q25↔F6: targets 4.7/4.9Å but partners are 11.4Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=5 · 3-10(G)=4 · coil(C)=2

```
CHEHEHHEGHHEHHHHHEHHHHGGHHHHGHHHHC
```

## Backbone H-bond Network

- total=20 · helix(i→i+4)=13 · sheet=7
  - S2 ↔ F6  (helix)
  - F6 ↔ F10  (helix)
  - K7 ↔ G11  (helix)
  - F10 ↔ R14  (helix)
  - G11 ↔ S15  (helix)
  - T13 ↔ F17  (helix)
  - S15 ↔ N19  (helix)
  - A16 ↔ L20  (helix)
  - F17 ↔ P21  (helix)
  - P21 ↔ Q25  (helix)
  - L22 ↔ Q26  (helix)
  - Q26 ↔ K30  (helix)
  - L28 ↔ K32  (helix)
  - D3 ↔ A8  (sheet)
  - D3 ↔ M12  (sheet)
  - D3 ↔ A18  (sheet)
  - D5 ↔ M12  (sheet)
  - D5 ↔ A18  (sheet)
  - A8 ↔ A18  (sheet)
  - M12 ↔ A18  (sheet)

## Solvent Accessibility (burial)

- buried=17 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=284 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=165 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9944 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=25 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
