# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1VII\seeds\seed_5\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 5.979 A
- tm_score_ca_ordered: 0.13652731326082612
- heavy_atom_rmsd: 7.520 A
- sidechain_heavy_atom_rmsd: 8.687 A
- **all-atom quality (honest):** heavy 7.520 A, sidechain 8.687 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 162
- bin_accuracy: 0.531

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F17 → 13 conflicts (50%); K32 → 7 conflicts (27%); K29 → 3 conflicts (12%)
- explained: 23/26 conflicts by 3 root cause(s)
- metrics: hubs=8 (frac 0.235), conflicts/hub=3.2, max_incompat=5.66Å, chain_span=0.676
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F17 + K32 + K29 — explain ~23/26 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F17** — severity 6.62, 7 conflict(s); suspect input ~`K29` (group: pull_in)
  - pull-in (wants closer): R14@4.0Å(now 7.5,conf 0.45), F6@4.9Å(now 9.4,conf 0.35), K29@5.2Å(now 11.3,conf 0.26), K32@5.8Å(now 9.1,conf 0.22)
  - R14↔Q25: targets 4.0/4.7Å but partners are 12.1Å apart → too_far_apart by 3.5Å
  - R14↔L20: targets 4.0/4.7Å but partners are 12.1Å apart → too_far_apart by 3.4Å
  - R14↔K29: targets 4.0/5.2Å but partners are 14.2Å apart → too_far_apart by 4.9Å
- **N27** — severity 5.53, 3 conflict(s); suspect input ~`K32` (group: push_out)
  - push-out (wants farther): G33@8.5Å(now 4.5,conf 0.82), L34@11.9Å(now 6.9,conf 0.67)
  - L34↔E31: targets 11.9/4.0Å but partners are 2.9Å apart → too_close_together by 5.0Å
  - G33↔K32: targets 8.5/5.0Å but partners are 0.9Å apart → too_close_together by 2.6Å
  - L34↔K32: targets 11.9/5.0Å but partners are 4.6Å apart → too_close_together by 2.3Å
- **F6** — severity 5.05, 3 conflict(s); suspect input ~`F17` (group: pull_in)
  - pull-in (wants closer): F17@4.9Å(now 9.4,conf 0.35)
  - S2↔F17: targets 4.8/4.9Å but partners are 15.4Å apart → too_far_apart by 5.7Å
  - D3↔F17: targets 4.0/4.9Å but partners are 14.5Å apart → too_far_apart by 5.6Å
  - L1↔F17: targets 4.7/4.9Å but partners are 12.6Å apart → too_far_apart by 3.0Å
- **R14** — severity 3.49, 4 conflict(s); suspect input ~`D3` (group: pull_in)
  - pull-in (wants closer): F17@4.0Å(now 7.5,conf 0.45), L1@5.2Å(now 11.1,conf 0.26), D3@5.2Å(now 9.2,conf 0.26)
  - F17↔D3: targets 4.0/5.2Å but partners are 14.5Å apart → too_far_apart by 5.3Å
  - F17↔L1: targets 4.0/5.2Å but partners are 12.6Å apart → too_far_apart by 3.3Å
  - A18↔F17: targets 9.6/4.0Å but partners are 3.9Å apart → too_close_together by 1.7Å
- **L28** — severity 3.27, 3 conflict(s); suspect input ~`K32` (group: push_out)
  - push-out (wants farther): G33@7.0Å(now 3.6,conf 0.94), L34@10.7Å(now 7.0,conf 0.82)
  - L34↔E31: targets 10.7/4.3Å but partners are 2.9Å apart → too_close_together by 3.5Å
  - L34↔K32: targets 10.7/4.0Å but partners are 4.6Å apart → too_close_together by 2.1Å
  - G33↔K32: targets 7.0/4.0Å but partners are 0.9Å apart → too_close_together by 2.0Å
- **F10** — severity 3.10, 3 conflict(s); suspect input ~`K29` (group: pull_in)
  - pull-in (wants closer): K29@4.9Å(now 8.0,conf 0.35)
  - S15↔K29: targets 7.9/4.9Å but partners are 16.3Å apart → too_far_apart by 3.5Å
  - K29↔R14: targets 4.9/5.2Å but partners are 14.2Å apart → too_far_apart by 4.1Å
  - A16↔K29: targets 6.8/4.9Å but partners are 14.0Å apart → too_far_apart by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=15 · 3-10(G)=3 · coil(C)=3

```
CECHEHHHGEHEEHHEGEGEEEHEHEHHEHEHEC
```

## Backbone H-bond Network

- total=63 · helix(i→i+4)=4 · sheet=59
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - W23 ↔ N27  (helix)
  - L28 ↔ K32  (helix)
  - S2 ↔ F10  (sheet)
  - S2 ↔ M12  (sheet)
  - S2 ↔ T13  (sheet)
  - S2 ↔ L22  (sheet)
  - D5 ↔ F10  (sheet)
  - D5 ↔ M12  (sheet)
  - D5 ↔ T13  (sheet)
  - D5 ↔ A16  (sheet)
  - D5 ↔ P21  (sheet)
  - D5 ↔ L22  (sheet)
  - D5 ↔ K24  (sheet)
  - F10 ↔ A16  (sheet)
  - F10 ↔ A18  (sheet)
  - F10 ↔ L20  (sheet)
  - F10 ↔ P21  (sheet)
  - F10 ↔ L22  (sheet)
  - … +43 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=189 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=93 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.2089 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
