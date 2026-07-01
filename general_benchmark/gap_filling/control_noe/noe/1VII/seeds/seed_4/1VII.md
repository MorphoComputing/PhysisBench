# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1VII\seeds\seed_4\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 5.338 A
- tm_score_ca_ordered: 0.14318874147179936
- heavy_atom_rmsd: 6.631 A
- sidechain_heavy_atom_rmsd: 7.662 A
- **all-atom quality (honest):** heavy 6.631 A, sidechain 7.662 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 51
- bin_accuracy: 0.490

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** F17 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=1 (frac 0.029), conflicts/hub=3.0, max_incompat=3.59Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): F17 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F17** — severity 2.69, 3 conflict(s); suspect input ~`F6` (group: pull_in)
  - pull-in (wants closer): Q25@4.7Å(now 7.2,conf 0.38), L28@4.9Å(now 7.7,conf 0.35), K29@5.2Å(now 7.7,conf 0.26)
  - Q25↔F6: targets 4.7/4.9Å but partners are 13.1Å apart → too_far_apart by 3.6Å
  - F6↔L28: targets 4.9/4.9Å but partners are 12.3Å apart → too_far_apart by 2.5Å
  - T13↔L28: targets 4.7/4.9Å but partners are 11.1Å apart → too_far_apart by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=4 · 3-10(G)=4 · coil(C)=1

```
EEHHHHHHGHHHHHHHEHHHHHGHHHHHGHEGHC
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=15 · sheet=3
  - D3 ↔ K7  (helix)
  - E4 ↔ A8  (helix)
  - F6 ↔ F10  (helix)
  - K7 ↔ G11  (helix)
  - A8 ↔ M12  (helix)
  - F10 ↔ R14  (helix)
  - G11 ↔ S15  (helix)
  - M12 ↔ A16  (helix)
  - R14 ↔ A18  (helix)
  - A16 ↔ L20  (helix)
  - A18 ↔ L22  (helix)
  - L20 ↔ K24  (helix)
  - P21 ↔ Q25  (helix)
  - L22 ↔ Q26  (helix)
  - Q26 ↔ K30  (helix)
  - L1 ↔ F17  (sheet)
  - S2 ↔ F17  (sheet)
  - F17 ↔ E31  (sheet)

## Solvent Accessibility (burial)

- buried=11 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=274 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=155 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1364 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
